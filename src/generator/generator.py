'''
生成器类，用于进行语义分析并且转化为LLVM
'''


from antlr4 import *
from parser_.simpleCParser import simpleCParser
from parser_.simpleCVisitor import simpleCVisitor
from SymbolTable import SymbolTable, RedefinitionError
from llvmlite import ir

class Visitor(simpleCVisitor):

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
        self.Functions = {}
        
        #结构体列表
        self.Structures = {}
        
        #当前所在函数
        self.CurrentFunctionName = ''
        
        self.Constants = 0
        self.NeedLoad = True
        self.EndifBlock = None
        
        #符号表
        self.SymbolTable = SymbolTable() 

    def visitProg(self, ctx:simpleCParser.ProgContext):
        '''
        语法规则：prog :(include)* (initialBlock|arrayInitBlock|structInitBlock|mStructDef|mFunction)*;
        描述：代码主文件
        返回：无
        '''
        donothing = True

    #函数相关函数
    def visitMFunction(self, ctx:simpleCParser.MFunctionContext):
        '''
        语法规则：mFunction : (mType|mVoid|mStruct) mID '(' params ')' '{' funcBody '}';
        描述：函数的定义
        返回：无
        '''
        donothing = True

    def visitParams(self, ctx:simpleCParser.ParamsContext):
        '''
        语法规则：params : param (','param)* |;
        描述：函数的参数列表
        返回：无
        '''
        donothing = True

    def visitParam(self, ctx:simpleCParser.ParamContext):
        '''
        语法规则：param : mType mID;
        描述：单一函数参数
        返回：无
        '''
        donothing = True

    def visitFuncBody(self, ctx:simpleCParser.FuncBodyContext):
        '''
        语法规则：funcBody : body returnBlock;
        描述：函数体
        返回：无
        '''
        donothing = True

    
    def visitFunc(self, ctx:simpleCParser.FuncContext):
        '''
        语法规则：func : (strlenFunc | atoiFunc | printfFunc | scanfFunc | getsFunc | selfDefinedFunc);
        描述：函数
        返回：无
        '''
        donothing = True

    def visitStrlenFunc(self, ctx:simpleCParser.StrlenFuncContext):
        '''
        语法规则：strlenFunc : 'strlen' '(' mID ')';
        描述：strlen函数
        返回：无
        '''
        donothing = True


    def visitPrintfFunc(self, ctx:simpleCParser.PrintfFuncContext):
        '''
        语法规则：printfFunc : 'printf' '(' (mSTRING | mID) (','expr)* ')';
        描述：printf函数
        返回：无
        '''
        donothing = True

    def visitScanfFunc(self, ctx:simpleCParser.ScanfFuncContext):
        '''
        语法规则：scanfFunc : 'scanf' '(' mSTRING (','('&')?(mID|arrayItem|structMember))* ')';
        描述：scanf函数
        返回：无
        '''
        donothing = True

    def visitGetsFunc(self, ctx:simpleCParser.GetsFuncContext):
        '''
        语法规则：getsFunc : 'gets' '(' mID ')';
        描述：gets函数
        返回：无
        '''
        donothing = True

    def visitSelfDefinedFunc(self, ctx:simpleCParser.SelfDefinedFuncContext):
        '''
        语法规则：selfDefinedFunc : mID '('((argument|mID)(','(argument|mID))*)? ')';
        描述：自定义函数
        返回：无
        '''
        donothing = True

    def visitArgument(self, ctx:simpleCParser.ArgumentContext):
        '''
        语法规则：argument : mINT | mDOUBLE | mCHAR | mSTRING;
        描述：函数参数
        返回：无
        '''
        donothing = True

    #块相关函数
    def visitBody(self, ctx:simpleCParser.BodyContext):
        '''
        语法规则：body : (block | func';')*;
        描述：语句块/函数块
        返回：无
        '''
        donothing = True

    def visitBlock(self, ctx:simpleCParser.BlockContext):
        '''
        语法规则：block : initialBlock | arrayInitBlock | structInitBlock | assignBlock | ifBlocks | whileBlock | forBlock | returnBlock;
        描述：语句块
        返回：无
        '''
        donothing = True

    def visitInitialBlock(self, ctx:simpleCParser.InitialBlockContext):
        '''
        语法规则：initialBlock : (mType) mID ('=' expr)? (',' mID ('=' expr)?)* ';';
        描述：初始化语句块
        返回：无
        '''
        donothing = True

    def visitArrayInitBlock(self, ctx:simpleCParser.ArrayInitBlockContext):
        '''
        语法规则：arrayInitBlock : mType mID '[' mINT ']'';'; 
        描述：数组初始化块
        返回：无
        '''
        donothing = True

    def visitAssignBlock(self, ctx:simpleCParser.AssignBlockContext):
        '''
        语法规则：assignBlock : ((arrayItem|mID|structMember) '=')+  expr ';';
        描述：赋值语句块
        返回：无
        '''
        donothing = True

    def visitReturnBlock(self, ctx:simpleCParser.ReturnBlockContext):
        '''
        语法规则：returnBlock : 'return' (mINT|mID)? ';';
        描述：return语句块
        返回：无
        '''
        donothing = True

    #分支相关函数
    def visitIfBlocks(self, ctx:simpleCParser.IfBlocksContext):
        '''
        语法规则：ifBlocks : ifBlock (elifBlock)* (elseBlock)?;
        描述：if语句块
        返回：无
        '''
        donothing = True

    def visitIfBlock(self, ctx:simpleCParser.IfBlockContext):
        '''
        语法规则：ifBlock : 'if' '('condition')' '{' body '}';
        描述：单一if语句块
        返回：无
        '''
        donothing = True

    def visitElifBlock(self, ctx:simpleCParser.ElifBlockContext):
        '''
        语法规则：elifBlock : 'else' 'if' '(' condition ')' '{' body '}';
        描述：单一elseif语句块
        返回：无
        '''
        donothing = True

    def visitElseBlock(self, ctx:simpleCParser.ElseBlockContext):
        '''
        语法规则：elseBlock : 'else' '{' body '}';
        描述：单一else语句块
        返回：无
        '''
        donothing = True

    def visitCondition(self, ctx:simpleCParser.ConditionContext):
        '''
        语法规则：condition :  expr;
        描述：判断条件
        返回：无
        '''
        donothing = True

    def visitWhileBlock(self, ctx:simpleCParser.WhileBlockContext):
        '''
        语法规则：whileBlock : 'while' '(' condition ')' '{' body '}';
        描述：while语句块
        返回：无
        '''
        donothing = True

    def visitForBlock(self, ctx:simpleCParser.ForBlockContext):
        '''
        语法规则：forBlock : 'for' '(' for1Block  ';' condition ';' for3Block ')' ('{' body '}'|';');
        描述：for语句块
        返回：无
        '''
        donothing = True

    def visitFor1Block(self, ctx:simpleCParser.For1BlockContext):
        '''
        语法规则：for1Block :  mID '=' expr (',' for1Block)?|;
        描述：for语句块的第一个参数
        返回：无
        '''
        donothing = True

    def visitFor3Block(self, ctx:simpleCParser.For3BlockContext):
        '''
        语法规则：for3Block : mID '=' expr (',' for3Block)?|;
        描述：for语句块的第三个参数
        返回：无
        '''
        donothing = True


    #运算相关函数
    def visitNeg(self, ctx:simpleCParser.NegContext):
        '''
        语法规则：expr :  op='!' expr
        描述：非运算
        返回：无
        '''
        donothing = True

    def visitOR(self, ctx:simpleCParser.ORContext):
        '''
        语法规则：expr : expr '||' expr 
        描述：或运算
        返回：无
        '''
        donothing = True

    def visitAND(self, ctx:simpleCParser.ANDContext):
        '''
        语法规则：expr : expr '&&' expr 
        描述：且运算
        返回：无
        '''
        donothing = True

    def visitIdentifier(self, ctx:simpleCParser.IdentifierContext):
        '''
        语法规则：expr : mID
        描述：常数
        返回：无
        '''
        donothing = True

    def visitParens(self, ctx:simpleCParser.ParensContext):
        '''
        语法规则：expr : '(' expr ')'
        描述：括号
        返回：无
        '''
        donothing = True

    def visitMulDiv(self, ctx:simpleCParser.MulDivContext):
        '''
        语法规则：expr : expr op=('*' | '/' | '%') expr
        描述：乘除
        返回：无
        '''
        donothing = True

    def visitAddSub(self, ctx:simpleCParser.AddSubContext):
        '''
        语法规则：expr op=('+' | '-') expr 
        描述：加减
        返回：无
        '''
        donothing = True

    def visitJudge(self, ctx:simpleCParser.JudgeContext):
        '''
        语法规则：expr : expr op=('==' | '!=' | '<' | '<=' | '>' | '>=') expr
        描述：比较
        返回：无
        '''
        donothing = True

    #类型相关函数
    def visitDouble(self, ctx:simpleCParser.DoubleContext):
        '''
        语法规则：expr : (op='-')? mDOUBLE
        描述：double类型
        返回：无
        '''
        donothing = True

    def visitFunction(self, ctx:simpleCParser.FunctionContext):
        '''
        语法规则：expr : func
        描述：函数类型
        返回：无
        '''
        donothing = True

    def visitArrayitem(self, ctx:simpleCParser.ArrayitemContext):
        '''
        语法规则：expr : arrayItem 
        描述：数组元素
        返回：无
        '''
        donothing = True

    def visitString(self, ctx:simpleCParser.StringContext):
        '''
        语法规则：expr : mSTRING
        描述：字符串
        返回：无
        '''
        donothing = True

    def visitChar(self, ctx:simpleCParser.CharContext):
        '''
        语法规则：expr : mCHAR
        描述：字符类型
        返回：无
        '''
        donothing = True

    def visitInt(self, ctx:simpleCParser.IntContext):
        '''
        语法规则：(op='-')? mINT
        描述：int类型
        返回：无
        '''
        donothing = True

    def visitMVoid(self, ctx:simpleCParser.MVoidContext):
        '''
        语法规则：mVoid : 'void';
        描述：void类型
        返回：无
        '''
        donothing = True

    def visitMArray(self, ctx:simpleCParser.MArrayContext):
        '''
        语法规则：mArray : mID '[' mINT ']'; 
        描述：数组类型
        返回：无
        '''
        donothing = True

    def visitMType(self, ctx:simpleCParser.MTypeContext):
        '''
        语法规则：mType : 'int'| 'double'| 'char'| 'string';
        描述：类型主函数
        返回：无
        '''
        donothing = True

    def visitArrayItem(self, ctx:simpleCParser.ArrayItemContext):
        '''
        语法规则：arrayItem : mID '[' expr ']';
        描述：数组变量
        返回：无
        '''
        donothing = True

    def visitMID(self, ctx:simpleCParser.MIDContext):
        '''
        语法规则：mID : ID;
        描述：ID
        返回：无
        '''
        donothing = True

    def visitMINT(self, ctx:simpleCParser.MINTContext):
        '''
        语法规则：mINT : INT;
        描述：int
        返回：无
        '''
        donothing = True

    def visitMDOUBLE(self, ctx:simpleCParser.MDOUBLEContext):
        '''
        语法规则：mDOUBLE : DOUBLE;
        描述：double
        返回：无
        '''
        donothing = True

    def visitMCHAR(self, ctx:simpleCParser.MCHARContext):
        '''
        语法规则：mCHAR : CHAR;
        描述：char
        返回：无
        '''
        donothing = True

    def visitMSTRING(self, ctx:simpleCParser.MSTRINGContext):
        '''
        语法规则：mSTRING : STRING;
        描述：string
        返回：无
        '''
        donothing = True

    #结构体相关函数
    def visitMStructDef(self, ctx:simpleCParser.MStructContext):
        '''
        语法规则：mStructDef : mStruct '{' (structParam)+ '}'';';
        描述：结构体定义
        返回：无
        '''
        donothing = True

    def visitStructParam(self, ctx:simpleCParser.StructParamContext):
        '''
        语法规则：structParam : (mType|mStruct) (mID|mArray) (',' (mID|mArray))* ';';
        描述：结构体参数
        返回：无
        '''
        donothing = True

    def visitStructInitBlock(self, ctx:simpleCParser.StructInitBlockContext):
        '''
        语法规则：structInitBlock : mStruct (mID|mArray)';';
        描述：结构体初始化
        返回：无
        '''
        donothing = True

    def visitStructMember(self, ctx:simpleCParser.StructMemberContext):
        '''
        语法规则：structMember: (mID | arrayItem)'.'(mID | arrayItem);
        描述：结构体成员变量
        返回：无
        '''
        donothing = True

    def visitMStruct(self, ctx:simpleCParser.MStructContext):
        '''
        语法规则：mStruct : 'struct' mID;
        描述：结构体类型变量的使用
        返回：无
        '''
        donothing = True
