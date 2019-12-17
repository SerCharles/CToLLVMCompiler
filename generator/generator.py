# Generated from simpleC.g4 by ANTLR 4.7.2
from antlr4 import *

from parser_.simpleCParser import simpleCParser
from parser_.simpleCVisitor import simpleCVisitor
from parser_.simpleCLexer import simpleCLexer
from generator.syntaxErrorListener import syntaxErrorListener
from llvmlite import ir

double = ir.DoubleType()
int1 = ir.IntType(1)
int32 = ir.IntType(32)
int8 = ir.IntType(8)
void = ir.VoidType()

# This class defines a complete generic visitor for a parse tree produced by simpleCParser.

class Visitor(simpleCVisitor):

    def __init__(self):
        super(simpleCVisitor, self).__init__()
        self.module = ir.Module()
        self.module.triple = "x86_64-pc-linux-gnu" # llvm.Target.from_default_triple()
        self.module.data_layout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128" # llvm.create_mcjit_compiler(backing_mod, target_machine)
        self.blocks = []
        self.builders = []
        self.local_vars = []
        self.global_vars = dict()
        self.functions = dict()
        self.structures = dict()
        self.cur_func = ''
        self.constants = 0
        self.need_load = True
        self.endifBlock = None
        # self.var_cnt = 0
        # self.label_cnt = 0
        self.symbol_table = dict() 
        self.scope = 0


    # Visit a parse tree produced by simpleCParser#prog.
    def visitProg(self, ctx:simpleCParser.ProgContext):
        #print('Prog')
        total = ctx.getChildCount()
        for index in range(total):
            # print(ctx.getChild(index).getRuleIndex())
            self.visit(ctx.getChild(index))
        return


    # Visit a parse tree produced by simpleCParser#include.
    def visitInclude(self, ctx:simpleCParser.IncludeContext):
        #print('include')
        return


    # Visit a parse tree produced by simpleCParser#mStruct.
    def visitMStructDef(self, ctx:simpleCParser.MStructContext):
        #print('structdef')
        self.enter_scope() 
        #print(ctx.getSourceInterval())
        struct_name = ctx.getChild(0).getChild(1).getText()
        if struct_name in self.structures:  # error!
            return
        index = 2
        struct_types = []
        struct_names = []
        while ctx.getChild(index).getText() != '}':
            struct_types_, struct_names_ = self.visit(ctx.getChild(index))
            struct_types = struct_types + struct_types_
            struct_names = struct_names + struct_names_
            index += 1
            self.var_insert_table(struct_names[-1])

        self.structures[struct_name] = {
                'members': struct_names,
                'struct': ir.LiteralStructType(struct_types)
        }
        self.leave_scope()
        # print(self.structures[struct_name]['struct'].elements[0])


    # Visit a parse tree produced by simpleCParser#structParam.
    def visitStructParam(self, ctx:simpleCParser.StructParamContext):
        #print('StructParam')
        # print(ctx.getText())
        struct_types = []
        struct_names = []
        if ctx.getChild(0).getChildCount() == 1:  # mtype
            index = 1
            type_ = self.visit(ctx.getChild(0))
            while True:
                if ctx.getChild(index).getChildCount() == 1: # 'mID'
                    struct_names.append(ctx.getChild(index).getText())
                    struct_types.append(type_)
                elif ctx.getChild(index).getChildCount() == 4: # mArray
                    res = self.visit(ctx.getChild(index))
                    struct_names.append(res['IDname'])
                    struct_types.append(ir.ArrayType(type_, res['length']))
                else:
                    print('almost impossible!')
                if ctx.getChild(index+1).getText() == ';':
                    break
                index += 2
            return struct_types, struct_names
        else: # mstruct
            pass
        # return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#structInitBlock.
    def visitStructInitBlock(self, ctx:simpleCParser.StructInitBlockContext):
        #print('structInitBlock')
        res = self.visit(ctx.getChild(0))
        type_ = res['struct']
        struct_name = ctx.getChild(0).getChild(1).getText()

        if ctx.getChild(1).getChildCount() == 1: # 'mID'
            IDname = ctx.getChild(1).getText()
            self.var_insert_table(IDname)
            if len(self.blocks) == 0: # global
                if IDname in self.global_vars: # error!
                    pass
                new_var = ir.GlobalVariable(self.module, type_, name=IDname)
                new_var.linkage = 'common'
                new_var.initializer = ir.Constant(type_, None)

                self.global_vars[IDname] = {
                    'struct_name': struct_name,
                    'type': type_,
                    'name': new_var
                }
            else:
                builder = self.builders[-1]
                varList = self.local_vars[-1]

                if IDname in self.varList: # error!
                    pass
                new_var = builder.alloca(type_, name=IDname)
                varList[IDname] = {
                    'struct_name': struct_name,
                    'type': type_,
                    'name': new_var
                }

        else: # mArray
            res = self.visit(ctx.getChild(1))
            IDname = res['IDname']
            type__ = ir.ArrayType(type_, res['length'])
            # print(struct_name)
            self.var_insert_table(IDname)
            if len(self.blocks) == 0: # global
                if IDname in self.global_vars: # error!
                    pass
                new_var = ir.GlobalVariable(self.module, type__, name=IDname)
                new_var.linkage = 'common'
                new_var.initializer = ir.Constant(type__, None)

                self.global_vars[IDname] = {
                    'struct_name': struct_name,
                    'type': type__,
                    'name': new_var
                }
            else:
                builder = self.builders[-1]
                varList = self.local_vars[-1]

                if IDname in self.varList: # error!
                    pass
                new_var = builder.alloca(type__, name=IDname)
                varList[IDname] = {
                    'struct_name': struct_name,
                    'type': type__,
                    'name': new_var
                }
        return


    # Visit a parse tree produced by simpleCParser#structMember.
    def visitStructMember(self, ctx:simpleCParser.StructMemberContext):
        builder = self.builders[-1]
        if ctx.getChild(0).getChildCount() == 1: # mID
            if ctx.getChild(2).getChildCount() == 1: # mID
                tmp_need_load = self.need_load
                self.need_load = False
                res = self.visit(ctx.getChild(0))
                self.need_load = tmp_need_load

                struct_name = res['struct_name']
                # print(self.structures[struct_name]['struct'].elements[0])
                index = self.structures[struct_name]['members'].index(ctx.getChild(2).getText())
                zero = ir.Constant(int32, 0)
                idx = ir.Constant(int32, index)
                new_var = builder.gep(res['name'], [zero, idx], inbounds=True)

                if self.need_load:
                    new_var = builder.load(new_var)

                return {
                    'type': self.structures[struct_name]['struct'].elements[index],
                    'const': False,
                    'name': new_var
                }
            else: # mArray
                pass
        else: # mArray
            if ctx.getChild(2).getChildCount() == 1: # mID

                tmp_need_load = self.need_load
                self.need_load = False
                res = self.visit(ctx.getChild(0))
                self.need_load = tmp_need_load

                # print(res)
                struct_name = res['struct_name']
                index = self.structures[struct_name]['members'].index(ctx.getChild(2).getText())
                zero = ir.Constant(int32, 0)
                idx = ir.Constant(int32, index)
                new_var = builder.gep(res['name'], [zero, idx], inbounds=True)

                if self.need_load:
                    new_var = builder.load(new_var)

                return {
                    'type': self.structures[struct_name]['struct'].elements[index],
                    'const': False,
                    'name': new_var
                }

            else: # mArray
                pass
        # return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#mFunction.
    def visitMFunction(self, ctx:simpleCParser.MFunctionContext):
        #print('MFunction')
        self.enter_scope()
        return_type = self.visit(ctx.getChild(0)) # mtype
        func_name = ctx.getChild(1).getText() # func name
        params = self.visit(ctx.getChild(3)) # func params

        params_type = []
        for index in range(len(params)):
            params_type.append(params[index]['type'])
        funcProto = ir.FunctionType(return_type, params_type)
        func = ir.Function(self.module, funcProto, name=func_name)
        for index in range(len(params)):
            func.args[index].name = params[index]['IDname']
        block = func.append_basic_block(name=func_name+'.entry')
        self.functions[func_name] = func
        builder = ir.IRBuilder(block)
        self.blocks.append(block)
        self.builders.append(builder)
        varList = {}
        for index in range(len(params)):
            new_var = builder.alloca(params[index]['type'])
            builder.store(func.args[index], new_var)
            varList[params[index]['IDname']] = {
                'type': params[index]['type'],
                'name': new_var
            }
        self.local_vars.append(varList)
        self.cur_func = func_name

        self.visit(ctx.getChild(6)) # func body

        self.cur_func = ''
        self.blocks.pop()
        self.builders.pop()
        self.local_vars.pop()
        self.leave_scope()
        return


    # Visit a parse tree produced by simpleCParser#params.
    def visitParams(self, ctx:simpleCParser.ParamsContext):
        total = ctx.getChildCount()
        if (total == 0):
            return []
        ret = [self.visit(ctx.getChild(0))]
        for index in range(2, total, 2):
            ret.append(self.visit(ctx.getChild(index)))
        return ret


    # Visit a parse tree produced by simpleCParser#param.
    def visitParam(self, ctx:simpleCParser.ParamContext):
        type_ = self.visit(ctx.getChild(0))
        IDname = ctx.getChild(1).getText()
        self.var_insert_table(IDname)
        return {
                'type': type_,
                'IDname': IDname
        }


    # Visit a parse tree produced by simpleCParser#funcBody.
    def visitFuncBody(self, ctx:simpleCParser.FuncBodyContext):
        self.enter_scope()
        total = ctx.getChildCount()
        # print(ctx.getText())
        for index in range(total):
            self.visit(ctx.getChild(index))
        self.leave_scope()
        return
        # return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#body.
    def visitBody(self, ctx:simpleCParser.BodyContext):
        #print('body')
        total = ctx.getChildCount()
        for index in range(total):
            self.visit(ctx.getChild(index))
            if self.blocks[-1].is_terminated:
                break
        return
        # return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#block.
    def visitBlock(self, ctx:simpleCParser.BlockContext):
        total = ctx.getChildCount()
        for index in range(total):
            self.visit(ctx.getChild(index))
        return
        # return self.visitChildren(ctx)


    def assignConvert(self, a, dtype):
        if (a['type'] == dtype):
            return a
        if self.isInteger(a['type']) and self.isInteger(dtype):
            if (a['type'] == int1):
                a = self.convertIIZ(a, dtype)
            else:
                a = self.convertIIS(a, dtype)
        elif self.isInteger(a['type']) and dtype == double:
            a = self.convertIDS(a)
        elif self.isInteger(dtype) and a['type'] == double:
            a = self.convertDIS(a)
        return a

    # Visit a parse tree produced by simpleCParser#initialBlock.
    def visitInitialBlock(self, ctx:simpleCParser.InitialBlockContext):
        #print('initialBlock')
        # print(ctx.getText())
        if len(self.blocks) == 0:   # global value
            type_ = self.visit(ctx.getChild(0))
            total = ctx.getChildCount()
            index = 1
            while index < total:
                IDname = ctx.getChild(index).getText()
                self.var_insert_table(IDname)
                if IDname in self.global_vars: # error!
                    return
                new_var = ir.GlobalVariable(self.module, type_, name=IDname)
                new_var.linkage = 'common'
                self.global_vars[IDname] = {
                    'type': type_,
                    'name': new_var
                }

                if ctx.getChild(index+1).getText() != '=':
                    index += 2
                else:
                    res = self.visit(ctx.getChild(index+2))
                    # res = self.assignConvert(res, type_)
                    # builder.store(res['name'], new_var)
                    # help(res['name'])
                    new_var.initializer = ir.Constant(res['type'], res['name'])
                    index += 4
            return

        builder = self.builders[-1]
        varList = self.local_vars[-1]

        type_ = self.visit(ctx.getChild(0))
        total = ctx.getChildCount()
        index = 1
        while index < total:
            IDname = ctx.getChild(index).getText()
            self.var_insert_table(IDname)

            if IDname in varList:   # error!
                return
            
            new_var = builder.alloca(type_, name=IDname)
            varList[IDname] = {
                'type': type_,
                'name': new_var
            }
            if ctx.getChild(index+1).getText() != '=':
                index += 2
            else:
                res = self.visit(ctx.getChild(index+2))
                res = self.assignConvert(res, type_)
                builder.store(res['name'], new_var)
                index += 4
        return
        # return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#arrayInitBlock.
    def visitArrayInitBlock(self, ctx:simpleCParser.ArrayInitBlockContext):
        type_ = self.visit(ctx.getChild(0))
        IDname = ctx.getChild(1).getText()
        Len = int(ctx.getChild(3).getText())

        if len(self.blocks) == 0:   # global value
            self.var_insert_table(IDname)
            if IDname in self.global_vars: # error!
                return
            new_var = ir.GlobalVariable(self.module, ir.ArrayType(type_, Len), name=IDname)
            new_var.linkage = 'common'
            self.global_vars[IDname] = {
                'type': ir.ArrayType(type_, Len),
                'name': new_var
            }
            return

        builder = self.builders[-1]
        varList = self.local_vars[-1]
        self.var_insert_table(IDname)
        if IDname in varList: # error!
            return
        new_var = builder.alloca(ir.ArrayType(type_, Len), name=IDname)
        varList[IDname] = {
            'type': ir.ArrayType(type_, Len),
            'name': new_var
        }
        return
        # return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#assignBlock.
    def visitAssignBlock(self, ctx:simpleCParser.AssignBlockContext):
        #print('assignBlock')
        builder = self.builders[-1]
        total = ctx.getChildCount()
        # print(total)
        IDname = ctx.getChild(0).getText()
        if not '[' in IDname and  not self.var_define_check(IDname):
            return
            
        res = self.visit(ctx.getChild(total-2))

        rng = [i for i in range(0, total-2, 2)]
        rng = rng[::-1]
        # print(rng)
        for i in range(len(rng)):
            index = rng[i]
            tmp_need_load = self.need_load
            self.need_load = False
            res1 = self.visit(ctx.getChild(index))
            self.need_load = tmp_need_load

            res = self.assignConvert(res, res1['type'])
            builder.store(res['name'], res1['name'])
            if index > 0:
                new_var = builder.load(res1['name'])
                res = {
                    'type': res1['type'],
                    'const': False,
                    'name': new_var
                }
        return res


    # Visit a parse tree produced by simpleCParser#ifBlocks.
    def visitIfBlocks(self, ctx:simpleCParser.IfBlocksContext):
        #print('ifblocks')
        builder = self.builders[-1]
        total = ctx.getChildCount()
        ifblocks = builder.append_basic_block()
        endif = builder.append_basic_block()
        builder.branch(ifblocks)

        self.blocks.pop()
        self.builders.pop()
        self.blocks.append(ifblocks)
        builder = ir.IRBuilder(ifblocks)
        self.builders.append(builder)

        tmp = self.endifBlock
        self.endifBlock = endif
        for index in range(total):
            self.visit(ctx.getChild(index))

        self.endifBlock = tmp

        bl = self.blocks.pop()
        bu = self.builders.pop()
        if not bl.is_terminated:
            bu.branch(endif)

        self.blocks.append(endif)
        self.builders.append(ir.IRBuilder(endif))
        return


    # Visit a parse tree produced by simpleCParser#ifBlock.
    def visitIfBlock(self, ctx:simpleCParser.IfBlockContext):
        self.enter_scope()
        res = self.visit(ctx.getChild(2))
        builder = self.builders[-1]
        new_block_true = builder.append_basic_block()
        new_block_false = builder.append_basic_block()
        builder.cbranch(res['name'], new_block_true, new_block_false)

        self.blocks.pop()
        self.builders.pop()

        self.blocks.append(new_block_true)
        self.builders.append(ir.IRBuilder(new_block_true))
        self.local_vars.append({})

        self.visit(ctx.getChild(5)) # body

        if not self.blocks[-1].is_terminated:
            builder = self.builders[-1]
            builder.branch(self.endifBlock)

        self.blocks.pop()
        self.builders.pop()
        self.local_vars.pop()

        self.blocks.append(new_block_false)
        self.builders.append(ir.IRBuilder(new_block_false))
        self.leave_scope()
        return


    # Visit a parse tree produced by simpleCParser#elifBlock.
    def visitElifBlock(self, ctx:simpleCParser.ElifBlockContext):
        self.enter_scope()
        res = self.visit(ctx.getChild(3))
        builder = self.builders[-1]
        new_block_true = builder.append_basic_block()
        new_block_false = builder.append_basic_block()
        builder.cbranch(res['name'], new_block_true, new_block_false)

        self.blocks.pop()
        self.builders.pop()

        self.blocks.append(new_block_true)
        self.builders.append(ir.IRBuilder(new_block_true))
        self.local_vars.append({})

        self.visit(ctx.getChild(6)) # body

        if not self.blocks[-1].is_terminated:
            builder = self.builders[-1]
            builder.branch(self.endifBlock)

        self.blocks.pop()
        self.builders.pop()
        self.local_vars.pop()

        self.blocks.append(new_block_false)
        self.builders.append(ir.IRBuilder(new_block_false))
        self.leave_scope()
        return


    # Visit a parse tree produced by simpleCParser#elseBlock.
    def visitElseBlock(self, ctx:simpleCParser.ElseBlockContext):
        self.enter_scope()
        self.local_vars.append({})

        self.visit(ctx.getChild(2)) # body

        self.local_vars.pop()
        self.leave_scope()
        return


    # Visit a parse tree produced by simpleCParser#condition.
    def visitCondition(self, ctx:simpleCParser.ConditionContext):
        #print('condition')
        # builder = self.builders[-1]
        ret = self.visit(ctx.getChild(0))
        ret = self.toBoolean(ret, notFlag=False)
        # total = ctx.getChildCount()
        # for index in range(1, total, 2):
        #     res = self.visit(ctx.getChild(index+1))
        #     res = self.toBoolean(res, notFlag=False)
        #     new_var = builder.and_(ret['name'], res['name'])
        #     ret  = {
        #             'type': ret['type'],
        #             'const': False,
        #             'name': new_var
        #     }
        return ret


    # Visit a parse tree produced by simpleCParser#whileBlock.
    def visitWhileBlock(self, ctx:simpleCParser.WhileBlockContext):
        #print('whileBlock')
        # print(ctx.getText())
        self.enter_scope()
        builder = self.builders[-1]
        whileCond = builder.append_basic_block()
        whileMain = builder.append_basic_block()
        whileEnd = builder.append_basic_block()
        builder.branch(whileCond)

        self.blocks.pop()
        self.builders.pop()
        self.blocks.append(whileCond)
        self.builders.append(ir.IRBuilder(whileCond))

        cond = self.visit(ctx.getChild(2)) # condition

        builder = self.builders[-1]
        builder.cbranch(cond['name'], whileMain, whileEnd)
        self.blocks.pop()
        self.builders.pop()


        self.blocks.append(whileMain)
        self.builders.append(ir.IRBuilder(whileMain))
        self.local_vars.append({})

        self.visit(ctx.getChild(5)) # body

        builder = self.builders[-1]
        builder.branch(whileCond)
        self.blocks.pop()
        self.builders.pop()
        self.local_vars.pop()

        self.blocks.append(whileEnd)
        self.builders.append(ir.IRBuilder(whileEnd))
        self.leave_scope()
        return


    # Visit a parse tree produced by simpleCParser#forBlock.
    def visitForBlock(self, ctx:simpleCParser.ForBlockContext):
        #print('forBlock')
        # print(ctx.getText())
        self.enter_scope()
        self.visit(ctx.getChild(2)) # initial block

        builder = self.builders[-1]
        forCond = builder.append_basic_block()
        forMain = builder.append_basic_block()
        forEnd = builder.append_basic_block()
        builder.branch(forCond)

        self.blocks.pop()
        self.builders.pop()
        self.blocks.append(forCond)
        self.builders.append(ir.IRBuilder(forCond))

        # print(ctx.getChild(4).getText())
        cond = self.visit(ctx.getChild(4)) # condition block

        builder = self.builders[-1]
        builder.cbranch(cond['name'], forMain, forEnd)
        self.blocks.pop()
        self.builders.pop()


        self.blocks.append(forMain)
        self.builders.append(ir.IRBuilder(forMain))
        self.local_vars.append({})

        if (ctx.getChildCount() == 11):
            self.visit(ctx.getChild(9)) # main body

        self.visit(ctx.getChild(6)) # step block

        builder = self.builders[-1]
        builder.branch(forCond)
        self.blocks.pop()
        self.builders.pop()
        self.local_vars.pop()

        self.blocks.append(forEnd)
        self.builders.append(ir.IRBuilder(forEnd))
        self.leave_scope()
        return
        # return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#for1Block.
    def visitFor1Block(self, ctx:simpleCParser.For1BlockContext):
        total = ctx.getChildCount()
        if total == 0:
            return

        # print(ctx.getChild(0).getText())
        # print(ctx.getChild(2).getText())

        tmp_need_load = self.need_load
        self.need_load = False
        res0 = self.visit(ctx.getChild(0)) # mID
        self.need_load = tmp_need_load

        res1 = self.visit(ctx.getChild(2)) # expr
        # print(res1)
        res1 = self.assignConvert(res1, res0['type'])
        builder = self.builders[-1]
        builder.store(res1['name'], res0['name'])

        if total > 3:
            self.visit(ctx.getChild(4))
        return


    # Visit a parse tree produced by simpleCParser#for3Block.
    def visitFor3Block(self, ctx:simpleCParser.For3BlockContext):
        total = ctx.getChildCount()
        if total == 0:
            return

        tmp_need_load = self.need_load
        self.need_load = False
        res0 = self.visit(ctx.getChild(0)) # mID
        self.need_load = tmp_need_load

        res1 = self.visit(ctx.getChild(2)) # expr
        # print(res1)
        res1 = self.assignConvert(res1, res0['type'])
        builder = self.builders[-1]
        builder.store(res1['name'], res0['name'])

        if total > 3:
            self.visit(ctx.getChild(4))
        return


    # Visit a parse tree produced by simpleCParser#returnBlock.
    def visitReturnBlock(self, ctx:simpleCParser.ReturnBlockContext):
        #print('returnBlock')
        builder = self.builders[-1]

        if ctx.getChildCount() == 2:
            ret = builder.ret_void()
            return {
                    'type': void,
                    'const': False,
                    'name': ret
            }

        res = self.visit(ctx.getChild(1))
        ret = builder.ret(res['name'])
        return {
                'type': void,
                'const': False,
                'name': ret
        }

    def convertIIZ(self, a, dtype):
        builder = self.builders[-1]
        new_var = builder.zext(a['name'], dtype)
        return {
                'type': dtype,
                'const': False,
                'name': new_var
        }

    def convertIIS(self, a, dtype):
        builder = self.builders[-1]
        new_var = builder.sext(a['name'], dtype)
        return {
                'type': dtype,
                'const': False,
                'name': new_var
        }

    def convertDIS(self, a, dtype):
        builder = self.builders[-1]
        new_var = builder.fptosi(a['name'], dtype)
        return {
                'type': dtype,
                'const': False,
                'name': new_var
        }

    def convertDIU(self, a, dtype):
        builder = self.builders[-1]
        new_var = builder.fptoui(a['name'], dtype)
        return {
                'type': dtype,
                'const': False,
                'name': new_var
        }

    def convertIDS(self, a):
        builder = self.builders[-1]
        new_var = builder.sitofp(a['name'], double)
        return {
                'type': double,
                'const': False,
                'name': new_var
        }

    def convertIDU(self, a):
        builder = self.builders[-1]
        new_var = builder.uitofp(a['name'], double)
        return {
                'type': double,
                'const': False,
                'name': new_var
        }

    def toBoolean(self, result, notFlag = True):
        if notFlag:
            op = '=='
        else:
            op = '!='
        builder = self.builders[-1]
        if result['type'] == int8 or result['type'] == int32:
            new_var = builder.icmp_signed(op, result['name'], ir.Constant(result['type'], 0))
            return {
                    'tpye': int1,
                    'const': False,
                    'name': new_var
            }
        elif result['type'] == double:
            new_var = builder.fcmp_ordered(op, result['name'], ir.Constant(double, 0))
            return {
                    'tpye': int1,
                    'const': False,
                    'name': new_var
            }
        return result

    # Visit a parse tree produced by simpleCParser#Neg.
    def visitNeg(self, ctx:simpleCParser.NegContext):
        #print(ctx.getChild(1).getText())
        res = self.visit(ctx.getChild(1))
        res = self.toBoolean(res, notFlag = True)
        return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#OR.
    def visitOR(self, ctx:simpleCParser.ORContext):
        res1 = self.visit(ctx.getChild(0))
        res1 = self.toBoolean(res1, notFlag=False)
        res2 = self.visit(ctx.getChild(2))
        res2 = self.toBoolean(res2, notFlag=False)
        builder = self.builders[-1]
        ret = builder.or_(res1['name'], res2['name'])
        return {
                'type': res1['type'],
                'const': False,
                'name': ret
        }

    # Visit a parse tree produced by simpleCParser#AND.
    def visitAND(self, ctx:simpleCParser.ANDContext):
        res1 = self.visit(ctx.getChild(0))
        res1 = self.toBoolean(res1, notFlag=False)
        res2 = self.visit(ctx.getChild(2))
        res2 = self.toBoolean(res2, notFlag=False)
        builder = self.builders[-1]
        ret = builder.and_(res1['name'], res2['name'])
        return {
                'type': res1['type'],
                'const': False,
                'name': ret
        }


    # Visit a parse tree produced by simpleCParser#identifier.
    def visitIdentifier(self, ctx:simpleCParser.IdentifierContext):
        return self.visit(ctx.getChild(0))


    # Visit a parse tree produced by simpleCParser#parens.
    def visitParens(self, ctx:simpleCParser.ParensContext):
        return self.visit(ctx.getChild(1))


    # Visit a parse tree produced by simpleCParser#arrayitem.
    def visitArrayitem(self, ctx:simpleCParser.ArrayitemContext):
        return self.visit(ctx.getChild(0))


    # Visit a parse tree produced by simpleCParser#string.
    def visitString(self, ctx:simpleCParser.StringContext):
        return self.visit(ctx.getChild(0))


    def isInteger(self, typ):
        return hasattr(typ, 'width')


    def exprConvert(self, a, b):
        if a['type'] == b['type']:
            return a, b
        if self.isInteger(a['type']) and self.isInteger(b['type']):
            if a['type'].width < b['type'].width:
                if a['type'].width == 1:
                    a = self.convertIIZ(a, b['type'])
                else:
                    a = self.convertIIS(a, b['type'])
            else:
                if b['type'].width == 1:
                    b = self.convertIIZ(b, a['type'])
                else:
                    b = self.convertIIS(b, a['type'])
        elif self.isInteger(a['type']) and b['type'] == double:
            a = convertIDS(a, b['type'])
        elif self.isInteger(b['type']) and a['type'] == double:
            b = convertIDS(b, a['type'])
        else:
            pass
        return a, b


    # Visit a parse tree produced by simpleCParser#MulDiv.
    def visitMulDiv(self, ctx:simpleCParser.MulDivContext):
        builder = self.builders[-1]
        res1 = self.visit(ctx.getChild(0))
        res2 = self.visit(ctx.getChild(2))
        res1, res2 = self.exprConvert(res1, res2)
        if ctx.getChild(1).getText() == '*':
            new_var = builder.mul(res1['name'], res2['name'])
        elif ctx.getChild(1).getText() == '/':
            new_var = builder.sdiv(res1['name'], res2['name'])
        elif ctx.getChild(1).getText() == '%':
            new_var = builder.srem(res1['name'], res2['name'])
        return {
                'type': res1['type'],
                'const': False,
                'name': new_var
        }


    # Visit a parse tree produced by simpleCParser#AddSub.
    def visitAddSub(self, ctx:simpleCParser.AddSubContext):
        builder = self.builders[-1]
        res1 = self.visit(ctx.getChild(0))
        res2 = self.visit(ctx.getChild(2))
        res1, res2 = self.exprConvert(res1, res2)
        if ctx.getChild(1).getText() == '+':
            new_var = builder.add(res1['name'], res2['name'])
        elif ctx.getChild(1).getText() == '-':
            new_var = builder.sub(res1['name'], res2['name'])
        return {
                'type': res1['type'],
                'const': False,
                'name': new_var
        }


    # Visit a parse tree produced by simpleCParser#double.
    def visitDouble(self, ctx:simpleCParser.DoubleContext):
        if ctx.getChild(0).getText() == '-':
            res = self.visit(ctx.getChild(1))
            builder = self.builders[-1]
            new_var = builder.neg(res['name'])
            return {
                    'type': res['type'],
                    'name': new_var
            }
        return self.visit(ctx.getChild(0))


    # Visit a parse tree produced by simpleCParser#function.
    def visitFunction(self, ctx:simpleCParser.FunctionContext):
        return self.visit(ctx.getChild(0))


    # Visit a parse tree produced by simpleCParser#char.
    def visitChar(self, ctx:simpleCParser.CharContext):
        return self.visit(ctx.getChild(0))


    # Visit a parse tree produced by simpleCParser#int.
    def visitInt(self, ctx:simpleCParser.IntContext):
        if ctx.getChild(0).getText() == '-':
            res = self.visit(ctx.getChild(1))
            builder = self.builders[-1]
            new_var = builder.neg(res['name'])
            return {
                    'type': res['type'],
                    'name': new_var
            }
        return self.visit(ctx.getChild(0))


    # Visit a parse tree produced by simpleCParser#mVoid.
    def visitMVoid(self, ctx:simpleCParser.MVoidContext):
        return void

    # Visit a parse tree produced by simpleCParser#mArray.
    def visitMArray(self, ctx:simpleCParser.MArrayContext):
        return {
            'IDname': ctx.getChild(0).getText(),
            'length': int(ctx.getChild(2).getText())
        }
        # return self.visitChildren(ctx)

    # Visit a parse tree produced by simpleCParser#Judge.
    def visitJudge(self, ctx:simpleCParser.JudgeContext):
        builder = self.builders[-1]
        res1 = self.visit(ctx.getChild(0))
        res2 = self.visit(ctx.getChild(2))
        res1, res2 = self.exprConvert(res1, res2)
        op = ctx.getChild(1).getText()
        if res1['type'] == double:
            new_var = builder.fcmp_ordered(op, res1['name'], res2['name'])
        elif self.isInteger(res1['type']):
            new_var = builder.icmp_signed(op, res1['name'], res2['name'])
        return {
                'type': int1,
                'const': False,
                'name': new_var
        }


    # Visit a parse tree produced by simpleCParser#mType.
    def visitMType(self, ctx:simpleCParser.MTypeContext):
        if ctx.getText() == 'int':
            return int32
        if ctx.getText() == 'char':
            return int8
        if ctx.getText() == 'double':
            return double
        return void


    # Visit a parse tree produced by simpleCParser#arrayItem.
    def visitArrayItem(self, ctx:simpleCParser.ArrayItemContext):
        tmp_need_load = self.need_load
        self.need_load = False
        res = self.visit(ctx.getChild(0)) # mID
        self.need_load = tmp_need_load
        # print(res)
        
        if isinstance(res['type'], ir.types.ArrayType):
            builder = self.builders[-1]
            # print(builder)

            tmp_need_load = self.need_load
            self.need_load = True
            res1 = self.visit(ctx.getChild(2)) # subscript
            self.need_load = tmp_need_load
            
            zero = ir.Constant(int32, 0)
            new_var = builder.gep(res['name'], [zero, res1['name']], inbounds=True)
            if self.need_load:
                new_var = builder.load(new_var)
            return {
                    'type': res['type'].element,
                    'const': False,
                    'name': new_var,
                    'struct_name': res['struct_name'] if 'struct_name' in res else None
            }
        else:   # error!
            pass
        # return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#func.
    def visitFunc(self, ctx:simpleCParser.FuncContext):
        return self.visit(ctx.getChild(0))
        # return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#strlenFunc.
    def visitStrlenFunc(self, ctx:simpleCParser.StrlenFuncContext):
        #print('strlenFunc')
        if 'strlen' in self.functions:
            strlen = self.functions['strlen']
        else:
            strlenty = ir.FunctionType(int32, [ir.PointerType(int8)], var_arg=False)
            strlen = ir.Function(self.module, strlenty, name="strlen")
            self.functions['strlen'] = strlen

        builder = self.builders[-1]
        zero = ir.Constant(int32, 0)

        tmp_need_load = self.need_load
        self.need_load = False
        res = self.visit(ctx.getChild(2))
        self.need_load = tmp_need_load

        arg = builder.gep(res['name'], [zero, zero], inbounds=True)
        ret = builder.call(strlen, [arg])

        return {
                'type': int32,
                'const': False,
                'name': ret
        }


    # Visit a parse tree produced by simpleCParser#atoiFunc.
    def visitAtoiFunc(self, ctx:simpleCParser.AtoiFuncContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#printfFunc.
    def visitPrintfFunc(self, ctx:simpleCParser.PrintfFuncContext):
        #print('printfFunc')
        if 'printf' in self.functions:
            printf = self.functions['printf']
        else:
            printfty = ir.FunctionType(int32, [ir.PointerType(int8)], var_arg=True)
            printf = ir.Function(self.module, printfty, name="printf")
            self.functions['printf'] = printf

        builder = self.builders[-1]
        zero = ir.Constant(int32, 0)
        # index = ir.Constant(int32, 0)
        # print(ctx.getChildCount())
        # print(ctx.getText())
        if ctx.getChildCount() == 4:
            res = self.visit(ctx.getChild(2)) # MString
            arg = builder.gep(res['name'], [zero, zero], inbounds=True)
            ret = builder.call(printf, [arg])
        else:
            res = self.visit(ctx.getChild(2)) # MString
            args = [builder.gep(res['name'], [zero, zero], inbounds=True)]

            total = ctx.getChildCount()
            for index in range(4, total-1, 2):
                res = self.visit(ctx.getChild(index))
                args.append(res['name'])
            ret = builder.call(printf, args)
        return {
                'type': int32,
                'const': False,
                'name': ret
        }


    # Visit a parse tree produced by simpleCParser#scanfFunc.
    def visitScanfFunc(self, ctx:simpleCParser.ScanfFuncContext):
        #print('scanfFunc')
        if 'scanf' in self.functions:
            scanf = self.functions['scanf']
        else:
            scanfty = ir.FunctionType(int32, [ir.PointerType(int8)], var_arg=True)
            scanf = ir.Function(self.module, scanfty, name="scanf")
            self.functions['scanf'] = scanf

        builder = self.builders[-1]
        zero = ir.Constant(int32, 0)
        res = self.visit(ctx.getChild(2)) # MString
        args = [builder.gep(res['name'], [zero, zero], inbounds=True), ]

        total = ctx.getChildCount()
        index = 4
        while index < total-1:
            if ctx.getChild(index).getText() == '&':
                tmp_need_load = self.need_load
                self.need_load = False
                res = self.visit(ctx.getChild(index+1))
                self.need_load = tmp_need_load
                args.append(res['name'])
                index += 3
            else:
                tmp_need_load = self.need_load
                self.need_load = True
                res = self.visit(ctx.getChild(index))
                self.need_load = tmp_need_load
                args.append(res['name'])
                index += 2

        ret = builder.call(scanf, args)
        return {
                'type': int32,
                'const': False,
                'name': ret
        }


    # Visit a parse tree produced by simpleCParser#getsFunc.
    def visitGetsFunc(self, ctx:simpleCParser.GetsFuncContext):
        #print('getsfunc')
        if 'gets' in self.functions:
            gets = self.functions['gets']
        else:
            getsty = ir.FunctionType(int32, [], var_arg=True)
            gets = ir.Function(self.module, getsty, name="gets")
            self.functions['gets'] = gets

        builder = self.builders[-1]
        zero = ir.Constant(int32, 0)

        tmp_need_load = self.need_load
        self.need_load = False
        res = self.visit(ctx.getChild(2))
        self.need_load = tmp_need_load

        arg = builder.gep(res['name'], [zero, zero], inbounds=True)
        ret = builder.call(gets, [arg])
        return {
                'type': int32,
                'const': False,
                'name': ret
        }


    # Visit a parse tree produced by simpleCParser#selfDefinedFunc.
    def visitSelfDefinedFunc(self, ctx:simpleCParser.SelfDefinedFuncContext):
        #print('selfDefinedFunc')
        # print(ctx.getText())
        builder = self.builders[-1]
        func_name = ctx.getChild(0).getText() # func name
        if func_name in self.functions:
            func = self.functions[func_name]
            # ret_type = self.functions[functions]

            total = ctx.getChildCount()
            # print(total-1)
            params = []
            for index in range(2, total-1, 2):
                res = self.visit(ctx.getChild(index))
                res = self.assignConvert(res, func.args[index//2-1].type)
                params.append(res['name'])
            new_var = builder.call(func, params)
            return {
                    'type': func.function_type.return_type,
                    'const': False,
                    'name': new_var
            }
        else:
            pass
        # return self.visitChildren(ctx)


    # Visit a parse tree produced by simpleCParser#argument.
    def visitArgument(self, ctx:simpleCParser.ArgumentContext):
        return self.visit(ctx.getChild(0))


    # Visit a parse tree produced by simpleCParser#mStruct.
    def visitMStruct(self, ctx:simpleCParser.MStructContext):
        return self.structures[ctx.getChild(1).getText()]


    # Visit a parse tree produced by simpleCParser#mID.
    def visitMID(self, ctx:simpleCParser.MIDContext):
        IDname = ctx.getText()
        if not self.var_define_check(IDname):
           return {
                'type': int32,
                'const': False,
                'name': ir.Constant(int32, None)
            }
        builder = self.builders[-1]
        total = len(self.local_vars)
        for index in range(total):
            varList = self.local_vars[total-1-index]
            if IDname in varList:
                if self.need_load:
                    var = builder.load(varList[IDname]['name'])
                    return {
                            'type': varList[IDname]['type'],
                            'const': False,
                            'name': var,
                            'struct_name':  varList[IDname]['struct_name'] if 'struct_name' in varList[IDname] else None
                    }
                else:
                    return {
                            'type': varList[IDname]['type'],
                            'const': False,
                            'name': varList[IDname]['name'],
                            'struct_name':  varList[IDname]['struct_name'] if 'struct_name' in varList[IDname] else None
                    }
        if IDname in self.global_vars:
            if self.need_load:
                var = builder.load(self.global_vars[IDname]['name'])
                return {
                        'type': self.global_vars[IDname]['type'],
                        'const': False,
                        'name': var,
                        'struct_name':  self.global_vars[IDname]['struct_name'] if 'struct_name' in self.global_vars[IDname] else None
                }
            else:
                return {
                        'type': self.global_vars[IDname]['type'],
                        'const': False,
                        'name': self.global_vars[IDname]['name'],
                        'struct_name':  self.global_vars[IDname]['struct_name'] if 'struct_name' in self.global_vars[IDname] else None
                }
        return {
                'type': void,
                'const': False,
                'name': ir.Constant(void, None)
        }


    # Visit a parse tree produced by simpleCParser#mINT.
    def visitMINT(self, ctx:simpleCParser.MINTContext):
        # idx = len(self.constants)
        # cont = ctx.getText().replace('\\n', '\\0A')
        # Len = self.calc_len(cont)-2

        # const = ir.GlobalVariable(module, ir.IntType(32), ".int%d"%idx)
        # const.initializer = ir.Constant(ir.IntType(32), int(ctx.getText()))
        # const.global_constant = True
        return {
                'type': int32,
                'const': True,
                'name': ir.Constant(int32, int(ctx.getText()))
        }


    # Visit a parse tree produced by simpleCParser#mDOUBLE.
    def visitMDOUBLE(self, ctx:simpleCParser.MDOUBLEContext):
        # return self.visitChildren(ctx)
        return {
                'type': double,
                'const': True,
                'name': ir.Constant(double, float(ctx.getText()))
        }


    # Visit a parse tree produced by simpleCParser#mCHAR.
    def visitMCHAR(self, ctx:simpleCParser.MCHARContext):
        # print(ctx.getChild(1).getText())
        return {
                'type': int8,
                'const': True,
                'name': ir.Constant(int8, ord(ctx.getText()[1]))
        }


    # Visit a parse tree produced by simpleCParser#mSTRING.
    def visitMSTRING(self, ctx:simpleCParser.MSTRINGContext):
        idx = self.constants
        self.constants += 1
        cont = ctx.getText().replace('\\n', '\n')
        cont = cont[1:-1]
        cont += '\0'
        # print(cont)
        Len = len(bytearray(cont, 'utf-8'))

        const = ir.GlobalVariable(self.module, ir.ArrayType(int8, Len), ".str%d"%idx)
        const.global_constant = True
        const.initializer = ir.Constant(ir.ArrayType(int8, Len), bytearray(cont, 'utf-8'))
        return {
                'type': ir.ArrayType(int8, Len),
                'const': False,
                'name': const
        }


    # Visit a parse tree produced by simpleCParser#mLIB.
    def visitMLIB(self, ctx:simpleCParser.MLIBContext):
        # return self.visitChildren(ctx)
        return
    
    def enter_scope(self):
        #print("enter scope", self.scope)
        self.scope += 1

    def leave_scope(self):
        #print(self.symbol_table)
        keys = list(self.symbol_table.keys())
        for index in keys:
            if self.symbol_table[index][-1] >= self.scope:
                self.symbol_table[index].pop(-1)
                if len(self.symbol_table[index]) == 0:
                    del self.symbol_table[index]
        self.scope -= 1
        #print("leave scope",self.scope)

    def var_define_check(self, var_name):
        if not self.symbol_table.__contains__(var_name):
            print("Semantic Error：", var_name, " is undefined")
            return False
        if (self.symbol_table[var_name][0] > self.scope):
            print("Semantic Error：", var_name, " is undefined")
            return False
        return True

    def var_insert_table(self, var_name):
        if not self.symbol_table.__contains__(var_name):
            self.symbol_table[var_name] = [self.scope]
        elif self.symbol_table[var_name][-1] == self.scope:
            print("Semantic Error：",var_name, " is redefined")
        else:    
            self.symbol_table[var_name].append(self.scope)

    def save(self, filename):
        """保存到文件"""
        with open(filename, "w") as f:
            f.write(repr(self.module))

def generate(input_filename, output_filename):
    """
    将C代码文件转成IR代码文件
    :param input_filename: C代码文件
    :param output_filename: IR代码文件
    :return: 生成是否成功
    """
    lexer = simpleCLexer(FileStream(input_filename))
    stream = CommonTokenStream(lexer)
    parser = simpleCParser(stream)
    parser.removeErrorListeners()
    errorListener = syntaxErrorListener()
    parser.addErrorListener(errorListener)

    tree = parser.prog()
    v = Visitor()
    v.visit(tree)
    v.save(output_filename)

#del simpleCParser