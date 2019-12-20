from antlr4 import *

from Parser.simpleCParser import simpleCParser
from Parser.simpleCVisitor import simpleCVisitor
from Parser.simpleCLexer import simpleCLexer
from llvmlite import ir
from Generator.SymbolTable import SymbolTable, Structure
#from Generator.Constants import Constants
from Generator.SyntaxErrorListener import syntaxErrorListener

double = ir.DoubleType()
int1 = ir.IntType(1)
int32 = ir.IntType(32)
int8 = ir.IntType(8)
void = ir.VoidType()


class Visitor(simpleCVisitor):
    '''
    生成器类，用于进行语义分析并且转化为LLVM
    '''
    def __init__(self):
        super(simpleCVisitor, self).__init__()

        #控制llvm生成
        self.Module = ir.Module()
        self.Module.triple = "x86_64-pc-linux-gnu" # llvm.Target.from_default_triple()
        self.Module.data_layout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128" # llvm.create_mcjit_compiler(backing_mod, target_machine)
        
        #语句块
        self.Blocks = []

        #待生成的llvm语句块
        self.Builders = []

        #函数列表
        self.Functions = dict()

        #结构体列表
        self.Structure = Structure()

        #当前所在函数
        self.CurrentFunction = ''
        self.Constants = 0

        #这个变量是否需要加载
        self.WhetherNeedLoad = True
        
        #endif块
        self.EndifBlock = None

        #符号表
        self.SymbolTable = SymbolTable()


    def visitProg(self, ctx:simpleCParser.ProgContext):
        '''
        语法规则：prog :(include)* (initialBlock|arrayInitBlock|structInitBlock|mStructDef|mFunction)*;
        描述：代码主文件
        返回：无
        '''
        for i in range(ctx.getChildCount()):
            self.visit(ctx.getChild(i))

    #结构体相关函数
    def visitMStructDef(self, ctx:simpleCParser.MStructContext):
        '''
        语法规则：mStructDef : mStruct '{' (structParam)+ '}'';';
        描述：结构体定义
        返回：无
        '''
        NewStructName = ctx.getChild(0).getChild(1).getText()

        #遍历结构体的变量，并且存储
        i = 2
        ParameterTypeList = []
        ParameterNameList = []
        TotalParams = ctx.getChildCount() - 2
        #逐行读取并且存储
        while i < TotalParams:
            ParameterTypeLine, ParameterNameLine = self.visit(ctx.getChild(i))
            ParameterTypeList = ParameterTypeList + ParameterTypeLine
            ParameterNameList = ParameterNameList + ParameterNameLine
            i += 1

        #存储结构体
        TheResult = self.Structure.AddItem(NewStructName, ParameterNameList, ParameterTypeList)
        if TheResult["result"] != "success":
            raise Exception(TheResult["reason"])

    def visitStructParam(self, ctx:simpleCParser.StructParamContext):
        '''
        语法规则：structParam : (mType|mStruct) (mID|mArray) (',' (mID|mArray))* ';';
        描述：处理一行结构体参数
        返回：无
        '''
        ParameterTypeLine = []
        ParameterNameLine = []
        #必须有类型
        if ctx.getChild(0).getChildCount() == 1:
            i = 1
            ParameterType = self.visit(ctx.getChild(0))
            Length = ctx.getChildCount()
            while i < Length:
                #处理MID的情况（单一变量）
                if ctx.getChild(i).getChildCount() == 1:
                    ParameterNameLine.append(ctx.getChild(i).getText())
                    ParameterTypeLine.append(ParameterType)
                #处理mArray的情况（数组）
                else:
                    ArrayInfo = self.visit(ctx.getChild(i))
                    ParameterNameLine.append(ArrayInfo['IDname'])
                    ParameterTypeLine.append(ir.ArrayType(ParameterType, ArrayInfo['length']))
                i = i + 2
            return ParameterTypeLine, ParameterNameLine


    def visitStructInitBlock(self, ctx:simpleCParser.StructInitBlockContext):
        '''
        语法规则：structInitBlock : mStruct (mID|mArray)';';
        描述：结构体初始化
        返回：无
        '''
        VariableInfo = self.visit(ctx.getChild(0))
        VariableType = VariableInfo['Type']
        StructName = ctx.getChild(0).getChild(1).getText()

        #处理结构体变量是单一变量的情况
        if ctx.getChild(1).getChildCount() == 1: 
            IDname = ctx.getChild(1).getText()
            CurrentType = VariableType
            #全局变量
            if self.SymbolTable.JudgeWhetherGlobal() == True:
                NewVariable = ir.GlobalVariable(self.Module, VariableType, name = IDname)
                NewVariable.linkage = 'common'
                NewVariable.initializer = ir.Constant(CurrentType, None)
            #局部变量
            else:
                TheBuilder = self.Builders[-1]
                NewVariable = TheBuilder.alloca(CurrentType, name = IDname)

        #处理结构体变量是数组的情况
        else:
            VariableInfo = self.visit(ctx.getChild(1))
            IDname = VariableInfo['IDname']
            CurrentType = ir.ArrayType(VariableType, VariableInfo['length'])
            #全局变量
            if self.SymbolTable.JudgeWhetherGlobal() == True:
                NewVariable = ir.GlobalVariable(self.Module, CurrentType, name = IDname)
                NewVariable.linkage = 'common'
                NewVariable.initializer = ir.Constant(CurrentType, None)
            else:
                TheBuilder = self.Builders[-1]
                NewVariable = TheBuilder.alloca(CurrentType, name = IDname)
        
        #存储这个结构体变量
        TheVariable = {}
        TheVariable["StructName"] = StructName
        TheVariable["Type"] = CurrentType
        TheVariable["Name"] = NewVariable
        TheResult = self.SymbolTable.AddItem(IDname, TheVariable)
        if TheResult["result"] != "success":
            #TODO 处理这个异常
            raise Exception(TheResult["reason"])
        return

    def visitStructMember(self, ctx:simpleCParser.StructMemberContext):
        '''
        语法规则：structMember: (mID | arrayItem)'.' mID;
        描述：获取结构体成员变量信息
        返回：无
        '''
        #TODO：修改g4
        TheBuilder = self.Builders[-1]
        #处理成员元素是单一变量的情况，TODO g4修改后删除
        if ctx.getChild(2).getChildCount() == 1: # mID
            CurrentNeedLoad = self.WhetherNeedLoad
            self.WhetherNeedLoad = False
            StructInfo = self.visit(ctx.getChild(0))
            self.WhetherNeedLoad = CurrentNeedLoad

            #读取结构体信息
            StructName = StructInfo['struct_name']
            FatherName = StructInfo["name"]
            Index = self.Structure.GetMemberIndex(StructName, ctx.getChild(2).getText())
            if Index == None:
                #TODO 处理这个异常
                raise Exception("未找到这个变量")
            Type = self.Structure.GetMemberType(StructName, ctx.getChild(2).getText())

            zero = ir.Constant(int32, 0)
            idx = ir.Constant(int32, Index)
            NewVariable = TheBuilder.gep(FatherName, [zero, idx], inbounds = True)
                
            if self.WhetherNeedLoad:
                NewVariable = TheBuilder.load(NewVariable)

            Result = {}
            Result["type"] = Type
            Result["name"] = NewVariable
            return Result
        else:
            raise NotImplementedError()

    #函数相关函数
    def visitMFunction(self, ctx:simpleCParser.MFunctionContext):

        '''
        语法规则：mFunction : (mType|mVoid|mStruct) mID '(' params ')' '{' funcBody '}';
        描述：函数的定义
        返回：无
        '''
        #获取返回值类型
        ReturnType = self.visit(ctx.getChild(0)) # mtype
        
        #获取函数名 todo
        FunctionName = ctx.getChild(1).getText() # func name
        
        #获取参数列表
        ParameterList = self.visit(ctx.getChild(3)) # func params

        #根据返回值，函数名称和参数生成llvm函数
        ParameterTypeList = []
        for i in range(len(ParameterList)):
            ParameterTypeList.append(ParameterList[i]['type'])
        LLVMFunctionType = ir.FunctionType(ReturnType, ParameterTypeList)
        LLVMFunction = ir.Function(self.Module, LLVMFunctionType, name = FunctionName)

        #存储函数的变量        
        for i in range(len(ParameterList)):
            LLVMFunction.args[i].name = ParameterList[i]['IDname']

        #存储函数的block
        TheBlock = LLVMFunction.append_basic_block(name = FunctionName + '.entry')

        #判断重定义，存储函数
        if FunctionName in self.Functions:
            #TODO 更合理的异常处理
            raise Exception("函数重定义错误！")
        else:
            self.Functions[FunctionName] = LLVMFunction

        TheBuilder = ir.IRBuilder(TheBlock)
        self.Blocks.append(TheBlock)
        self.Builders.append(TheBuilder)

        #进一层
        self.CurrentFunction = FunctionName
        self.SymbolTable.EnterScope()

        #存储函数的变量
        VariableList = {}
        for i in range(len(ParameterList)):
            NewVariable = TheBuilder.alloca(ParameterList[i]['type'])
            TheBuilder.store(LLVMFunction.args[i], NewVariable)
            TheVariable = {}
            TheVariable["Type"] = ParameterList[i]['type']
            TheVariable["Name"] = NewVariable
            TheResult = self.SymbolTable.AddItem(ParameterList[i]['IDname'], TheVariable)
            if TheResult["result"] != "success":
                #TODO 处理这个异常
                raise Exception(TheResult["reason"])

        #处理函数body
        self.visit(ctx.getChild(6)) # func body

        #处理完毕，退一层
        self.CurrentFunction = ''
        self.Blocks.pop()
        self.Builders.pop()
        self.SymbolTable.QuitScope()
        return


    def visitParams(self, ctx:simpleCParser.ParamsContext):
        '''
        语法规则：params : param (','param)* |;
        描述：函数的参数列表
        返回：处理后的函数参数列表
        '''
        Length = ctx.getChildCount()
        if (Length == 0):
            return []
        ParameterList = []
        i = 0
        while i < Length:
            NewParameter = self.visit(ctx.getChild(i))
            ParameterList.append(NewParameter)
            i += 2
        return ParameterList


    def visitParam(self, ctx:simpleCParser.ParamContext):
        '''
        语法规则：param : mType mID;
        描述：返回函数参数
        返回：一个字典，字典的Type是类型，Name是参数名
        '''
        Type = self.visit(ctx.getChild(0))
        IDname = ctx.getChild(1).getText()
        Result = {'type': Type, 'IDname': IDname}
        return Result


    def visitFuncBody(self, ctx:simpleCParser.FuncBodyContext):
        '''
        语法规则：funcBody : body returnBlock;
        描述：函数体
        返回：无
        '''
        self.SymbolTable.EnterScope()
        for index in range(ctx.getChildCount()):
            self.visit(ctx.getChild(index))
        self.SymbolTable.QuitScope()
        return


    def visitBody(self, ctx:simpleCParser.BodyContext):
        '''
        语法规则：body : (block | func';')*;
        描述：语句块/函数块
        返回：无
        '''
        for i in range(ctx.getChildCount()):
            self.visit(ctx.getChild(i))
            if self.Blocks[-1].is_terminated:
                break
        return

    #调用函数相关函数
    def visitFunc(self, ctx:simpleCParser.FuncContext):
        '''
        语法规则：func : (strlenFunc | atoiFunc | printfFunc | scanfFunc | getsFunc | selfDefinedFunc);
        描述：函数
        返回：无
        '''
        return self.visit(ctx.getChild(0))

    def visitStrlenFunc(self, ctx:simpleCParser.StrlenFuncContext):
        '''
        语法规则：strlenFunc : 'strlen' '(' mID ')';
        描述：strlen函数
        返回：函数返回值
        '''
        if 'strlen' in self.Functions:
            strlen = self.Functions['strlen']
        else:
            strlenType = ir.FunctionType(int32, [ir.PointerType(int8)], var_arg = False)
            strlen = ir.Function(self.Module, strlenType, name = "strlen")
            self.Functions['strlen'] = strlen

        TheBuilder = self.Builders[-1]
        zero = ir.Constant(int32, 0)

        #加载变量
        PreviousNeedLoad = self.WhetherNeedLoad
        self.WhetherNeedLoad = False
        res = self.visit(ctx.getChild(2))
        self.WhetherNeedLoad = PreviousNeedLoad

        Arguments = TheBuilder.gep(res['name'], [zero, zero], inbounds = True)
        ReturnVariableName = TheBuilder.call(strlen, [Arguments])

        Result = {'type': int32, 'name': ReturnVariableName}
        return Result

    def visitPrintfFunc(self, ctx:simpleCParser.PrintfFuncContext):
        '''
        语法规则：printfFunc : 'printf' '(' (mSTRING | mID) (','expr)* ')';
        描述：printf函数
        返回：函数返回值
        '''        
        if 'printf' in self.Functions:
            printf = self.Functions['printf']
        else:
            printfType = ir.FunctionType(int32, [ir.PointerType(int8)], var_arg = True)
            printf = ir.Function(self.Module, printfType, name = "printf")
            self.Functions['printf'] = printf

        TheBuilder = self.Builders[-1]
        zero = ir.Constant(int32, 0)

        #就一个变量
        if ctx.getChildCount() == 4:
            ParameterInfo = self.visit(ctx.getChild(2)) 
            Argument = TheBuilder.gep(ParameterInfo['name'], [zero, zero], inbounds = True)
            ReturnVariableName = TheBuilder.call(printf, [Argument])
        else:
            ParameterInfo = self.visit(ctx.getChild(2))
            Arguments = [TheBuilder.gep(ParameterInfo['name'], [zero, zero], inbounds = True)]

            Length = ctx.getChildCount()
            i = 4
            while i < Length - 1:
                OneParameter = self.visit(ctx.getChild(i))
                Arguments.append(OneParameter['name'])
                i += 2
            ReturnVariableName = TheBuilder.call(printf, Arguments)
        Result = {'type': int32, 'name': ReturnVariableName}
        return Result


    def visitScanfFunc(self, ctx:simpleCParser.ScanfFuncContext):
        '''
        语法规则：scanfFunc : 'scanf' '(' mSTRING (','('&')?(mID|arrayItem|structMember))* ')';
        描述：scanf函数
        返回：函数返回值
        '''        
        if 'scanf' in self.Functions:
            scanf = self.Functions['scanf']
        else:
            scanfType = ir.FunctionType(int32, [ir.PointerType(int8)], var_arg = True)
            scanf = ir.Function(self.Module, scanfType, name="scanf")
            self.Functions['scanf'] = scanf

        TheBuilder = self.Builders[-1]
        zero = ir.Constant(int32, 0)
        ParameterList = self.visit(ctx.getChild(2)) # MString
        Arguments = [TheBuilder.gep(ParameterList['name'], [zero, zero], inbounds = True)]

        Length = ctx.getChildCount()
        i = 4
        while i < Length - 1:
            if ctx.getChild(i).getText() == '&':
                #读取变量
                PreviousNeedLoad = self.WhetherNeedLoad
                self.WhetherNeedLoad = False
                TheParameter = self.visit(ctx.getChild(i + 1))
                self.WhetherNeedLoad = PreviousNeedLoad
                Arguments.append(TheParameter['name'])
                i += 3
            else:
                PreviousNeedLoad = self.WhetherNeedLoad
                self.WhetherNeedLoad = True
                TheParameter = self.visit(ctx.getChild(i))
                self.WhetherNeedLoad = PreviousNeedLoad
                Arguments.append(TheParameter['name'])
                i += 2

        ReturnVariableName = TheBuilder.call(scanf, Arguments)
        Result = {'type': int32, 'name': ReturnVariableName}
        return Result


    def visitGetsFunc(self, ctx:simpleCParser.GetsFuncContext):
        '''
        语法规则：getsFunc : 'gets' '(' mID ')';
        描述：gets函数
        返回：函数返回值
        '''        
        if 'gets' in self.Functions:
            gets = self.Functions['gets']
        else:
            getsType = ir.FunctionType(int32, [], var_arg = True)
            gets = ir.Function(self.Module, getsType, name = "gets")
            self.Functions['gets'] = gets

        TheBuilder = self.Builders[-1]
        zero = ir.Constant(int32, 0)

        PreviousNeedLoad = self.WhetherNeedLoad
        self.WhetherNeedLoad = False
        ParameterInfo = self.visit(ctx.getChild(2))
        self.WhetherNeedLoad = PreviousNeedLoad

        Arguments = [TheBuilder.gep(ParameterInfo['name'], [zero, zero], inbounds = True)]
        ReturnVariableName = TheBuilder.call(gets, Arguments)
        Result = {'type': int32, 'name': ReturnVariableName}
        return Result


    def visitSelfDefinedFunc(self, ctx:simpleCParser.SelfDefinedFuncContext):
        '''
        语法规则：selfDefinedFunc : mID '('((argument|mID)(','(argument|mID))*)? ')';
        描述：自定义函数
        返回：函数返回值
        '''
        TheBuilder = self.Builders[-1]
        FunctionName = ctx.getChild(0).getText() # func name
        if FunctionName in self.Functions:
            TheFunction = self.Functions[FunctionName]

            Length = ctx.getChildCount()
            ParameterList = []
            i = 2
            while i < Length - 1:
                TheParameter = self.visit(ctx.getChild(i))
                TheParameter = self.assignConvert(TheParameter, TheFunction.args[i // 2 - 1].type)
                ParameterList.append(TheParameter['name'])
                i += 2
            ReturnVariableName = TheBuilder.call(TheFunction, ParameterList)
            Result = {'type': TheFunction.function_type.return_type, 'name': ReturnVariableName}
            return Result
        else:
            raise Exception("函数未定义！")
            #TODO 处理异常

    #语句块相关函数
    def visitBlock(self, ctx:simpleCParser.BlockContext):
        '''
        语法规则：block : initialBlock | arrayInitBlock | structInitBlock | assignBlock | ifBlocks | whileBlock | forBlock | returnBlock;
        描述：语句块
        返回：无
        '''
        for i in range(ctx.getChildCount()):
            self.visit(ctx.getChild(i))
        return

    def visitInitialBlock(self, ctx:simpleCParser.InitialBlockContext):
        '''
        语法规则：initialBlock : (mType) mID ('=' expr)? (',' mID ('=' expr)?)* ';';
        描述：初始化语句块
        返回：无
        '''
        #初始化全局变量
        ParameterType = self.visit(ctx.getChild(0))
        Length = ctx.getChildCount()
        
        i = 1
        while i < Length:
            IDname = ctx.getChild(i).getText()
            if self.SymbolTable.JudgeWhetherGlobal() == True:   
                NewVariable = ir.GlobalVariable(self.Module, ParameterType, name = IDname)
                NewVariable.linkage = 'common'
            else:
                TheBuilder = self.Builders[-1]
                NewVariable = TheBuilder.alloca(ParameterType, name = IDname)

            TheVariable = {}
            TheVariable["Type"] = ParameterType
            TheVariable["Name"] = NewVariable
            TheResult = self.SymbolTable.AddItem(IDname, TheVariable)
            if TheResult["result"] != "success":
                #TODO 处理这个异常
                raise Exception(TheResult["reason"])

            if ctx.getChild(i + 1).getText() != '=':
                i += 2
            else:
                #初始化
                Value = self.visit(ctx.getChild(i + 2))
                if self.SymbolTable.JudgeWhetherGlobal() == True:   
                    #全局变量
                    NewVariable.initializer = ir.Constant(Value['type'], Value['name'])
                else:
                    #局部变量，可能有强制类型转换
                    Value = self.assignConvert(Value, ParameterType)
                    TheBuilder = self.Builders[-1]
                    TheBuilder.store(Value['name'], NewVariable)
                i += 4
        return

    def visitArrayInitBlock(self, ctx:simpleCParser.ArrayInitBlockContext):
        '''
        语法规则：arrayInitBlock : mType mID '[' mINT ']'';'; 
        描述：数组初始化块
        返回：无
        '''
        Type = self.visit(ctx.getChild(0))
        IDname = ctx.getChild(1).getText()
        Length = int(ctx.getChild(3).getText())

        if self.SymbolTable.JudgeWhetherGlobal() == True:   
            #全局变量
            NewVariable = ir.GlobalVariable(self.Module, ir.ArrayType(Type, Length), name = IDname)
            NewVariable.linkage = 'common'
        else:
            TheBuilder = self.Builders[-1]
            NewVariable = TheBuilder.alloca(ir.ArrayType(Type, Length), name = IDname)

        TheVariable = {}
        TheVariable["Type"] = ir.ArrayType(Type, Length)
        TheVariable["Name"] = NewVariable
        TheResult = self.SymbolTable.AddItem(IDname, TheVariable)
        if TheResult["result"] != "success":
            #TODO 处理这个异常
            raise Exception(TheResult["reason"])
        return

    def visitAssignBlock(self, ctx:simpleCParser.AssignBlockContext):
        '''
        语法规则：assignBlock : ((arrayItem|mID|structMember) '=')+  expr ';';
        描述：赋值语句块
        返回：无
        '''
        TheBuilder = self.Builders[-1]
        Length = ctx.getChildCount()
        IDname = ctx.getChild(0).getText()
        if not '[' in IDname and self.SymbolTable.JudgeExist(IDname) == False:
            #TODO 异常处理
            raise Exception("变量未定义！")

        #待赋值结果 
        ValueToBeAssigned = self.visit(ctx.getChild(Length - 2))

        i = 0
        Result = {'type': ValueToBeAssigned['type'], 'name': ValueToBeAssigned['name']}
        #遍历全部左边变量赋值
        while i < Length - 2:
            PreviousNeedLoad = self.WhetherNeedLoad
            self.WhetherNeedLoad = False
            TheVariable = self.visit(ctx.getChild(i))
            self.WhetherNeedLoad = PreviousNeedLoad

            TheValueToBeAssigned = ValueToBeAssigned
            TheValueToBeAssigned = self.assignConvert(TheValueToBeAssigned, TheVariable['type'])
            TheBuilder.store(TheValueToBeAssigned['name'], TheVariable['name'])
            if i > 0:
                ReturnVariable = TheBuilder.load(TheVariable['name'])
                Result = {'type': TheVariable['type'], 'name': ReturnVariable}
            i += 2
        return Result

    #TODO
    #条件分支相关函数
    def visitIfBlocks(self, ctx:simpleCParser.IfBlocksContext):
        '''
        语法规则：ifBlocks : ifBlock (elifBlock)* (elseBlock)?;
        描述：if语句块
        返回：无
        '''
        builder = self.Builders[-1]
        total = ctx.getChildCount()
        ifblocks = builder.append_basic_block()
        endif = builder.append_basic_block()
        builder.branch(ifblocks)

        self.Blocks.pop()
        self.Builders.pop()
        self.Blocks.append(ifblocks)
        builder = ir.IRBuilder(ifblocks)
        self.Builders.append(builder)

        tmp = self.EndifBlock
        self.EndifBlock = endif
        for index in range(total):
            self.visit(ctx.getChild(index))

        self.EndifBlock = tmp

        bl = self.Blocks.pop()
        bu = self.Builders.pop()
        if not bl.is_terminated:
            bu.branch(endif)

        self.Blocks.append(endif)
        self.Builders.append(ir.IRBuilder(endif))
        return


    def visitIfBlock(self, ctx:simpleCParser.IfBlockContext):
        self.SymbolTable.EnterScope()
        res = self.visit(ctx.getChild(2))
        builder = self.Builders[-1]
        new_block_true = builder.append_basic_block()
        new_block_false = builder.append_basic_block()
        builder.cbranch(res['name'], new_block_true, new_block_false)

        self.Blocks.pop()
        self.Builders.pop()

        self.Blocks.append(new_block_true)
        self.Builders.append(ir.IRBuilder(new_block_true))

        self.visit(ctx.getChild(5)) # body

        if not self.Blocks[-1].is_terminated:
            builder = self.Builders[-1]
            builder.branch(self.EndifBlock)

        self.Blocks.pop()
        self.Builders.pop()

        self.Blocks.append(new_block_false)
        self.Builders.append(ir.IRBuilder(new_block_false))
        self.SymbolTable.QuitScope()
        return


    def visitElifBlock(self, ctx:simpleCParser.ElifBlockContext):
        '''
        语法规则：elifBlock : 'else' 'if' '(' condition ')' '{' body '}';
        描述：单一elseif语句块
        返回：无
        '''
        self.SymbolTable.EnterScope()
        res = self.visit(ctx.getChild(3))
        builder = self.Builders[-1]
        new_block_true = builder.append_basic_block()
        new_block_false = builder.append_basic_block()
        builder.cbranch(res['name'], new_block_true, new_block_false)

        self.Blocks.pop()
        self.Builders.pop()

        self.Blocks.append(new_block_true)
        self.Builders.append(ir.IRBuilder(new_block_true))

        self.visit(ctx.getChild(6)) # body

        if not self.Blocks[-1].is_terminated:
            builder = self.Builders[-1]
            builder.branch(self.EndifBlock)

        self.Blocks.pop()
        self.Builders.pop()

        self.Blocks.append(new_block_false)
        self.Builders.append(ir.IRBuilder(new_block_false))
        self.SymbolTable.QuitScope()
        return


    def visitElseBlock(self, ctx:simpleCParser.ElseBlockContext):
        '''
        语法规则：elseBlock : 'else' '{' body '}';
        描述：单一else语句块
        返回：无
        '''
        self.SymbolTable.EnterScope()
        self.visit(ctx.getChild(2)) # body
        self.SymbolTable.QuitScope()
        return


    def visitCondition(self, ctx:simpleCParser.ConditionContext):
        '''
        语法规则：condition :  expr;
        描述：判断条件
        返回：无
        '''

        ret = self.visit(ctx.getChild(0))
        ret = self.toBoolean(ret, notFlag=False)
        return ret


    def visitWhileBlock(self, ctx:simpleCParser.WhileBlockContext):
        '''
        语法规则：whileBlock : 'while' '(' condition ')' '{' body '}';
        描述：while语句块
        返回：无
        '''

        self.SymbolTable.EnterScope()
        builder = self.Builders[-1]
        whileCond = builder.append_basic_block()
        whileMain = builder.append_basic_block()
        whileEnd = builder.append_basic_block()
        builder.branch(whileCond)

        self.Blocks.pop()
        self.Builders.pop()
        self.Blocks.append(whileCond)
        self.Builders.append(ir.IRBuilder(whileCond))

        cond = self.visit(ctx.getChild(2)) # condition

        builder = self.Builders[-1]
        builder.cbranch(cond['name'], whileMain, whileEnd)
        self.Blocks.pop()
        self.Builders.pop()


        self.Blocks.append(whileMain)
        self.Builders.append(ir.IRBuilder(whileMain))
        self.visit(ctx.getChild(5)) # body

        builder = self.Builders[-1]
        builder.branch(whileCond)
        self.Blocks.pop()
        self.Builders.pop()

        self.Blocks.append(whileEnd)
        self.Builders.append(ir.IRBuilder(whileEnd))
        self.SymbolTable.QuitScope()
        return


    def visitForBlock(self, ctx:simpleCParser.ForBlockContext):
        '''
        语法规则：forBlock : 'for' '(' for1Block  ';' condition ';' for3Block ')' ('{' body '}'|';');
        描述：for语句块
        返回：无
        '''
        self.SymbolTable.EnterScope()
        self.visit(ctx.getChild(2)) # initial block

        builder = self.Builders[-1]
        forCond = builder.append_basic_block()
        forMain = builder.append_basic_block()
        forEnd = builder.append_basic_block()
        builder.branch(forCond)

        self.Blocks.pop()
        self.Builders.pop()
        self.Blocks.append(forCond)
        self.Builders.append(ir.IRBuilder(forCond))

        cond = self.visit(ctx.getChild(4)) # condition block

        builder = self.Builders[-1]
        builder.cbranch(cond['name'], forMain, forEnd)
        self.Blocks.pop()
        self.Builders.pop()


        self.Blocks.append(forMain)
        self.Builders.append(ir.IRBuilder(forMain))

        if (ctx.getChildCount() == 11):
            self.visit(ctx.getChild(9)) # main body

        self.visit(ctx.getChild(6)) # step block

        builder = self.Builders[-1]
        builder.branch(forCond)
        self.Blocks.pop()
        self.Builders.pop()

        self.Blocks.append(forEnd)
        self.Builders.append(ir.IRBuilder(forEnd))
        self.SymbolTable.QuitScope()
        return


    def visitFor1Block(self, ctx:simpleCParser.For1BlockContext):
        '''
        语法规则：for1Block :  mID '=' expr (',' for1Block)?|;
        描述：for语句块的第一个参数
        返回：无
        '''
        total = ctx.getChildCount()
        if total == 0:
            return

        tmp_need_load = self.WhetherNeedLoad
        self.WhetherNeedLoad = False
        res0 = self.visit(ctx.getChild(0)) # mID
        self.WhetherNeedLoad = tmp_need_load

        res1 = self.visit(ctx.getChild(2)) # expr
        res1 = self.assignConvert(res1, res0['type'])
        builder = self.Builders[-1]
        builder.store(res1['name'], res0['name'])

        if total > 3:
            self.visit(ctx.getChild(4))
        return


    def visitFor3Block(self, ctx:simpleCParser.For3BlockContext):
        '''
        语法规则：for3Block : mID '=' expr (',' for3Block)?|;
        描述：for语句块的第三个参数
        返回：无
        '''
        total = ctx.getChildCount()
        if total == 0:
            return

        tmp_need_load = self.WhetherNeedLoad
        self.WhetherNeedLoad = False
        res0 = self.visit(ctx.getChild(0)) # mID
        self.WhetherNeedLoad = tmp_need_load

        res1 = self.visit(ctx.getChild(2)) # expr
        res1 = self.assignConvert(res1, res0['type'])
        builder = self.Builders[-1]
        builder.store(res1['name'], res0['name'])

        if total > 3:
            self.visit(ctx.getChild(4))
        return


    def visitReturnBlock(self, ctx:simpleCParser.ReturnBlockContext):
        '''
        语法规则：returnBlock : 'return' (mINT|mID)? ';';
        描述：return语句块
        返回：无
        '''
        builder = self.Builders[-1]

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

    #运算和表达式求值，类型转换相关函数
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
    
    def convertIIZ(self, a, dtype):
        builder = self.Builders[-1]
        new_var = builder.zext(a['name'], dtype)
        return {
                'type': dtype,
                'const': False,
                'name': new_var
        }

    def convertIIS(self, a, dtype):
        builder = self.Builders[-1]
        new_var = builder.sext(a['name'], dtype)
        return {
                'type': dtype,
                'const': False,
                'name': new_var
        }

    def convertDIS(self, a, dtype):
        builder = self.Builders[-1]
        new_var = builder.fptosi(a['name'], dtype)
        return {
                'type': dtype,
                'const': False,
                'name': new_var
        }

    def convertDIU(self, a, dtype):
        builder = self.Builders[-1]
        new_var = builder.fptoui(a['name'], dtype)
        return {
                'type': dtype,
                'const': False,
                'name': new_var
        }

    def convertIDS(self, a):
        builder = self.Builders[-1]
        new_var = builder.sitofp(a['name'], double)
        return {
                'type': double,
                'const': False,
                'name': new_var
        }

    def convertIDU(self, a):
        builder = self.Builders[-1]
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
        builder = self.Builders[-1]
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

    def visitNeg(self, ctx:simpleCParser.NegContext):
        '''
        语法规则：expr :  op='!' expr
        描述：非运算
        返回：无
        '''
        res = self.visit(ctx.getChild(1))
        res = self.toBoolean(res, notFlag = True)
        return self.visitChildren(ctx)


    def visitOR(self, ctx:simpleCParser.ORContext):
        '''
        语法规则：expr : expr '||' expr 
        描述：或运算
        返回：无
        '''
        res1 = self.visit(ctx.getChild(0))
        res1 = self.toBoolean(res1, notFlag=False)
        res2 = self.visit(ctx.getChild(2))
        res2 = self.toBoolean(res2, notFlag=False)
        builder = self.Builders[-1]
        ret = builder.or_(res1['name'], res2['name'])
        return {
                'type': res1['type'],
                'const': False,
                'name': ret
        }

    def visitAND(self, ctx:simpleCParser.ANDContext):
        '''
        语法规则：expr : expr '&&' expr 
        描述：且运算
        返回：无
        '''
        res1 = self.visit(ctx.getChild(0))
        res1 = self.toBoolean(res1, notFlag=False)
        res2 = self.visit(ctx.getChild(2))
        res2 = self.toBoolean(res2, notFlag=False)
        builder = self.Builders[-1]
        ret = builder.and_(res1['name'], res2['name'])
        return {
                'type': res1['type'],
                'const': False,
                'name': ret
        }


    def visitIdentifier(self, ctx:simpleCParser.IdentifierContext):
        '''
        语法规则：expr : mID
        描述：常数
        返回：无
        '''
        return self.visit(ctx.getChild(0))


    def visitParens(self, ctx:simpleCParser.ParensContext):
        '''
        语法规则：expr : '(' expr ')'
        描述：括号
        返回：无
        '''
        return self.visit(ctx.getChild(1))


    def visitArrayitem(self, ctx:simpleCParser.ArrayitemContext):
        '''
        语法规则：expr : arrayItem 
        描述：数组元素
        返回：无
        '''
        return self.visit(ctx.getChild(0))


    def visitString(self, ctx:simpleCParser.StringContext):
        '''
        语法规则：expr : mSTRING
        描述：字符串
        返回：无
        '''
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


    def visitMulDiv(self, ctx:simpleCParser.MulDivContext):
        '''
        语法规则：expr : expr op=('*' | '/' | '%') expr
        描述：乘除
        返回：无
        '''
        builder = self.Builders[-1]
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


    def visitAddSub(self, ctx:simpleCParser.AddSubContext):
        '''
        语法规则：expr op=('+' | '-') expr 
        描述：加减
        返回：无
        '''
        builder = self.Builders[-1]
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


    def visitDouble(self, ctx:simpleCParser.DoubleContext):
        '''
        语法规则：expr : (op='-')? mDOUBLE
        描述：double类型
        返回：无
        '''
        if ctx.getChild(0).getText() == '-':
            res = self.visit(ctx.getChild(1))
            builder = self.Builders[-1]
            new_var = builder.neg(res['name'])
            return {
                    'type': res['type'],
                    'name': new_var
            }
        return self.visit(ctx.getChild(0))


    def visitFunction(self, ctx:simpleCParser.FunctionContext):
        '''
        语法规则：expr : func
        描述：函数类型
        返回：无
        '''
        return self.visit(ctx.getChild(0))


    def visitChar(self, ctx:simpleCParser.CharContext):
        '''
        语法规则：expr : mCHAR
        描述：字符类型
        返回：无
        '''
        return self.visit(ctx.getChild(0))


    def visitInt(self, ctx:simpleCParser.IntContext):
        '''
        语法规则：(op='-')? mINT
        描述：int类型
        返回：无
        '''
        if ctx.getChild(0).getText() == '-':
            res = self.visit(ctx.getChild(1))
            builder = self.Builders[-1]
            new_var = builder.neg(res['name'])
            return {
                    'type': res['type'],
                    'name': new_var
            }
        return self.visit(ctx.getChild(0))


    def visitMVoid(self, ctx:simpleCParser.MVoidContext):
        '''
        语法规则：mVoid : 'void';
        描述：void类型
        返回：无
        '''
        return void

    def visitMArray(self, ctx:simpleCParser.MArrayContext):
        '''
        语法规则：mArray : mID '[' mINT ']'; 
        描述：数组类型
        返回：无
        '''
        return {
            'IDname': ctx.getChild(0).getText(),
            'length': int(ctx.getChild(2).getText())
        }

    def visitJudge(self, ctx:simpleCParser.JudgeContext):
        '''
        语法规则：expr : expr op=('==' | '!=' | '<' | '<=' | '>' | '>=') expr
        描述：比较
        返回：无
        '''
        builder = self.Builders[-1]
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

    #变量和变量类型相关函数
    def visitMType(self, ctx:simpleCParser.MTypeContext):
        '''
        语法规则：mType : 'int'| 'double'| 'char'| 'string';
        描述：类型主函数
        返回：无
        '''
        if ctx.getText() == 'int':
            return int32
        if ctx.getText() == 'char':
            return int8
        if ctx.getText() == 'double':
            return double
        return void

    def visitArrayItem(self, ctx:simpleCParser.ArrayItemContext):
        '''
        语法规则：expr : arrayItem 
        描述：数组元素
        返回：无
        '''
        tmp_need_load = self.WhetherNeedLoad
        self.WhetherNeedLoad = False
        res = self.visit(ctx.getChild(0)) # mID
        #print("res is", res)
        self.WhetherNeedLoad = tmp_need_load
        
        if isinstance(res['type'], ir.types.ArrayType):
            builder = self.Builders[-1]

            tmp_need_load = self.WhetherNeedLoad
            self.WhetherNeedLoad = True
            res1 = self.visit(ctx.getChild(2)) # subscript
            self.WhetherNeedLoad = tmp_need_load
            
            zero = ir.Constant(int32, 0)
            new_var = builder.gep(res['name'], [zero, res1['name']], inbounds=True)
            if self.WhetherNeedLoad:
                new_var = builder.load(new_var)
            return {
                    'type': res['type'].element,
                    'const': False,
                    'name': new_var,
                    'struct_name': res['struct_name'] if 'struct_name' in res else None
            }
        else:   # error!
            pass

    def visitArgument(self, ctx:simpleCParser.ArgumentContext):
        '''
        语法规则：argument : mINT | mDOUBLE | mCHAR | mSTRING;
        描述：函数参数
        返回：无
        '''
        return self.visit(ctx.getChild(0))

    def visitMStruct(self, ctx:simpleCParser.MStructContext):
        '''
        语法规则：mStruct : 'struct' mID;
        描述：结构体类型变量的使用
        返回：无
        '''
        return self.Structure.List[ctx.getChild(1).getText()]

    def visitMID(self, ctx:simpleCParser.MIDContext):
        '''
        语法规则：mID : ID;
        描述：ID
        返回：无
        '''
        IDname = ctx.getText()
        if self.SymbolTable.JudgeExist(IDname) != True:
           return {
                'type': int32,
                'const': False,
                'name': ir.Constant(int32, None)
            }
        builder = self.Builders[-1]
        TheItem = self.SymbolTable.GetItem(IDname)
        #print(TheItem)
        if TheItem != None:
            if self.WhetherNeedLoad:
                var = builder.load(TheItem["Name"])
                return {
                    "type" : TheItem["Type"],
                    "const" : False,
                    "name" : var,
                    "struct_name" : TheItem["StructName"] if "StructName" in TheItem else None
                }
            else:
                return {
                    "type" : TheItem["Type"],
                    "const" : False,
                    "name" : TheItem["Name"],
                    "struct_name" : TheItem["StructName"] if "StructName" in TheItem else None
                }
        else:
            return {
                'type': void,
                'const': False,
                'name': ir.Constant(void, None)
            }

    def visitMINT(self, ctx:simpleCParser.MINTContext):
        '''
        语法规则：mINT : INT;
        描述：int
        返回：无
        '''
        return {
                'type': int32,
                'const': True,
                'name': ir.Constant(int32, int(ctx.getText()))
        }

    def visitMDOUBLE(self, ctx:simpleCParser.MDOUBLEContext):
        '''
        语法规则：mDOUBLE : DOUBLE;
        描述：double
        返回：无
        '''
        return {
                'type': double,
                'const': True,
                'name': ir.Constant(double, float(ctx.getText()))
        }

    def visitMCHAR(self, ctx:simpleCParser.MCHARContext):
        '''
        语法规则：mCHAR : CHAR;
        描述：char
        返回：无
        '''
        return {
                'type': int8,
                'const': True,
                'name': ir.Constant(int8, ord(ctx.getText()[1]))
        }

    def visitMSTRING(self, ctx:simpleCParser.MSTRINGContext):
        '''
        语法规则：mSTRING : STRING;
        描述：string
        返回：无
        '''
        idx = self.Constants
        self.Constants += 1
        cont = ctx.getText().replace('\\n', '\n')
        cont = cont[1:-1]
        cont += '\0'
        Len = len(bytearray(cont, 'utf-8'))

        const = ir.GlobalVariable(self.Module, ir.ArrayType(int8, Len), ".str%d"%idx)
        const.global_constant = True
        const.initializer = ir.Constant(ir.ArrayType(int8, Len), bytearray(cont, 'utf-8'))
        return {
                'type': ir.ArrayType(int8, Len),
                'const': False,
                'name': const
        }

    def save(self, filename):
        """保存到文件"""
        with open(filename, "w") as f:
            f.write(repr(self.Module))

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
