// Generated from /Users/vincent/CToLLVMCompiler/src/Parser/simpleC.g4 by ANTLR 4.7.1
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class simpleCParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, T__30=31, 
		T__31=32, T__32=33, T__33=34, T__34=35, T__35=36, T__36=37, T__37=38, 
		T__38=39, T__39=40, T__40=41, T__41=42, ID=43, INT=44, DOUBLE=45, CHAR=46, 
		STRING=47, LIB=48, Conjunction=49, Operator=50, LineComment=51, BlockComment=52, 
		WS=53;
	public static final int
		RULE_prog = 0, RULE_include = 1, RULE_mStructDef = 2, RULE_structParam = 3, 
		RULE_mFunction = 4, RULE_params = 5, RULE_param = 6, RULE_funcBody = 7, 
		RULE_body = 8, RULE_block = 9, RULE_initialBlock = 10, RULE_arrayInitBlock = 11, 
		RULE_structInitBlock = 12, RULE_assignBlock = 13, RULE_ifBlocks = 14, 
		RULE_ifBlock = 15, RULE_elifBlock = 16, RULE_elseBlock = 17, RULE_condition = 18, 
		RULE_whileBlock = 19, RULE_forBlock = 20, RULE_for1Block = 21, RULE_for3Block = 22, 
		RULE_returnBlock = 23, RULE_expr = 24, RULE_mType = 25, RULE_mArray = 26, 
		RULE_mVoid = 27, RULE_mStruct = 28, RULE_structMember = 29, RULE_arrayItem = 30, 
		RULE_func = 31, RULE_strlenFunc = 32, RULE_atoiFunc = 33, RULE_printfFunc = 34, 
		RULE_scanfFunc = 35, RULE_getsFunc = 36, RULE_selfDefinedFunc = 37, RULE_argument = 38, 
		RULE_mID = 39, RULE_mINT = 40, RULE_mDOUBLE = 41, RULE_mCHAR = 42, RULE_mSTRING = 43, 
		RULE_mLIB = 44;
	public static final String[] ruleNames = {
		"prog", "include", "mStructDef", "structParam", "mFunction", "params", 
		"param", "funcBody", "body", "block", "initialBlock", "arrayInitBlock", 
		"structInitBlock", "assignBlock", "ifBlocks", "ifBlock", "elifBlock", 
		"elseBlock", "condition", "whileBlock", "forBlock", "for1Block", "for3Block", 
		"returnBlock", "expr", "mType", "mArray", "mVoid", "mStruct", "structMember", 
		"arrayItem", "func", "strlenFunc", "atoiFunc", "printfFunc", "scanfFunc", 
		"getsFunc", "selfDefinedFunc", "argument", "mID", "mINT", "mDOUBLE", "mCHAR", 
		"mSTRING", "mLIB"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'#include'", "'<'", "'>'", "'{'", "'}'", "';'", "','", "'('", "')'", 
		"'='", "'['", "']'", "'if'", "'else'", "'while'", "'for'", "'return'", 
		"'!'", "'*'", "'/'", "'%'", "'+'", "'-'", "'=='", "'!='", "'<='", "'>='", 
		"'&&'", "'||'", "'int'", "'double'", "'char'", "'string'", "'void'", "'struct'", 
		"'.'", "'strlen'", "'atoi'", "'printf'", "'scanf'", "'&'", "'gets'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, "ID", "INT", "DOUBLE", "CHAR", 
		"STRING", "LIB", "Conjunction", "Operator", "LineComment", "BlockComment", 
		"WS"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "simpleC.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public simpleCParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class ProgContext extends ParserRuleContext {
		public List<IncludeContext> include() {
			return getRuleContexts(IncludeContext.class);
		}
		public IncludeContext include(int i) {
			return getRuleContext(IncludeContext.class,i);
		}
		public List<InitialBlockContext> initialBlock() {
			return getRuleContexts(InitialBlockContext.class);
		}
		public InitialBlockContext initialBlock(int i) {
			return getRuleContext(InitialBlockContext.class,i);
		}
		public List<ArrayInitBlockContext> arrayInitBlock() {
			return getRuleContexts(ArrayInitBlockContext.class);
		}
		public ArrayInitBlockContext arrayInitBlock(int i) {
			return getRuleContext(ArrayInitBlockContext.class,i);
		}
		public List<StructInitBlockContext> structInitBlock() {
			return getRuleContexts(StructInitBlockContext.class);
		}
		public StructInitBlockContext structInitBlock(int i) {
			return getRuleContext(StructInitBlockContext.class,i);
		}
		public List<MStructDefContext> mStructDef() {
			return getRuleContexts(MStructDefContext.class);
		}
		public MStructDefContext mStructDef(int i) {
			return getRuleContext(MStructDefContext.class,i);
		}
		public List<MFunctionContext> mFunction() {
			return getRuleContexts(MFunctionContext.class);
		}
		public MFunctionContext mFunction(int i) {
			return getRuleContext(MFunctionContext.class,i);
		}
		public ProgContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_prog; }
	}

	public final ProgContext prog() throws RecognitionException {
		ProgContext _localctx = new ProgContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_prog);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(93);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__0) {
				{
				{
				setState(90);
				include();
				}
				}
				setState(95);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(103);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__29) | (1L << T__30) | (1L << T__31) | (1L << T__32) | (1L << T__33) | (1L << T__34))) != 0)) {
				{
				setState(101);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
				case 1:
					{
					setState(96);
					initialBlock();
					}
					break;
				case 2:
					{
					setState(97);
					arrayInitBlock();
					}
					break;
				case 3:
					{
					setState(98);
					structInitBlock();
					}
					break;
				case 4:
					{
					setState(99);
					mStructDef();
					}
					break;
				case 5:
					{
					setState(100);
					mFunction();
					}
					break;
				}
				}
				setState(105);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class IncludeContext extends ParserRuleContext {
		public MLIBContext mLIB() {
			return getRuleContext(MLIBContext.class,0);
		}
		public IncludeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_include; }
	}

	public final IncludeContext include() throws RecognitionException {
		IncludeContext _localctx = new IncludeContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_include);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(106);
			match(T__0);
			setState(107);
			match(T__1);
			setState(108);
			mLIB();
			setState(109);
			match(T__2);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MStructDefContext extends ParserRuleContext {
		public MStructContext mStruct() {
			return getRuleContext(MStructContext.class,0);
		}
		public List<StructParamContext> structParam() {
			return getRuleContexts(StructParamContext.class);
		}
		public StructParamContext structParam(int i) {
			return getRuleContext(StructParamContext.class,i);
		}
		public MStructDefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mStructDef; }
	}

	public final MStructDefContext mStructDef() throws RecognitionException {
		MStructDefContext _localctx = new MStructDefContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_mStructDef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(111);
			mStruct();
			setState(112);
			match(T__3);
			setState(114); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(113);
				structParam();
				}
				}
				setState(116); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__29) | (1L << T__30) | (1L << T__31) | (1L << T__32) | (1L << T__34))) != 0) );
			setState(118);
			match(T__4);
			setState(119);
			match(T__5);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StructParamContext extends ParserRuleContext {
		public MTypeContext mType() {
			return getRuleContext(MTypeContext.class,0);
		}
		public MStructContext mStruct() {
			return getRuleContext(MStructContext.class,0);
		}
		public List<MIDContext> mID() {
			return getRuleContexts(MIDContext.class);
		}
		public MIDContext mID(int i) {
			return getRuleContext(MIDContext.class,i);
		}
		public List<MArrayContext> mArray() {
			return getRuleContexts(MArrayContext.class);
		}
		public MArrayContext mArray(int i) {
			return getRuleContext(MArrayContext.class,i);
		}
		public StructParamContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_structParam; }
	}

	public final StructParamContext structParam() throws RecognitionException {
		StructParamContext _localctx = new StructParamContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_structParam);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(123);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__29:
			case T__30:
			case T__31:
			case T__32:
				{
				setState(121);
				mType();
				}
				break;
			case T__34:
				{
				setState(122);
				mStruct();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(127);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,5,_ctx) ) {
			case 1:
				{
				setState(125);
				mID();
				}
				break;
			case 2:
				{
				setState(126);
				mArray();
				}
				break;
			}
			setState(136);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__6) {
				{
				{
				setState(129);
				match(T__6);
				setState(132);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,6,_ctx) ) {
				case 1:
					{
					setState(130);
					mID();
					}
					break;
				case 2:
					{
					setState(131);
					mArray();
					}
					break;
				}
				}
				}
				setState(138);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(139);
			match(T__5);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MFunctionContext extends ParserRuleContext {
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public ParamsContext params() {
			return getRuleContext(ParamsContext.class,0);
		}
		public FuncBodyContext funcBody() {
			return getRuleContext(FuncBodyContext.class,0);
		}
		public MTypeContext mType() {
			return getRuleContext(MTypeContext.class,0);
		}
		public MVoidContext mVoid() {
			return getRuleContext(MVoidContext.class,0);
		}
		public MStructContext mStruct() {
			return getRuleContext(MStructContext.class,0);
		}
		public MFunctionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mFunction; }
	}

	public final MFunctionContext mFunction() throws RecognitionException {
		MFunctionContext _localctx = new MFunctionContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_mFunction);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(144);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__29:
			case T__30:
			case T__31:
			case T__32:
				{
				setState(141);
				mType();
				}
				break;
			case T__33:
				{
				setState(142);
				mVoid();
				}
				break;
			case T__34:
				{
				setState(143);
				mStruct();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(146);
			mID();
			setState(147);
			match(T__7);
			setState(148);
			params();
			setState(149);
			match(T__8);
			setState(150);
			match(T__3);
			setState(151);
			funcBody();
			setState(152);
			match(T__4);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParamsContext extends ParserRuleContext {
		public List<ParamContext> param() {
			return getRuleContexts(ParamContext.class);
		}
		public ParamContext param(int i) {
			return getRuleContext(ParamContext.class,i);
		}
		public ParamsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_params; }
	}

	public final ParamsContext params() throws RecognitionException {
		ParamsContext _localctx = new ParamsContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_params);
		int _la;
		try {
			setState(163);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__29:
			case T__30:
			case T__31:
			case T__32:
				enterOuterAlt(_localctx, 1);
				{
				setState(154);
				param();
				setState(159);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__6) {
					{
					{
					setState(155);
					match(T__6);
					setState(156);
					param();
					}
					}
					setState(161);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
				break;
			case T__8:
				enterOuterAlt(_localctx, 2);
				{
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParamContext extends ParserRuleContext {
		public MTypeContext mType() {
			return getRuleContext(MTypeContext.class,0);
		}
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public ParamContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_param; }
	}

	public final ParamContext param() throws RecognitionException {
		ParamContext _localctx = new ParamContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_param);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(165);
			mType();
			setState(166);
			mID();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FuncBodyContext extends ParserRuleContext {
		public BodyContext body() {
			return getRuleContext(BodyContext.class,0);
		}
		public ReturnBlockContext returnBlock() {
			return getRuleContext(ReturnBlockContext.class,0);
		}
		public FuncBodyContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_funcBody; }
	}

	public final FuncBodyContext funcBody() throws RecognitionException {
		FuncBodyContext _localctx = new FuncBodyContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_funcBody);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(168);
			body();
			setState(169);
			returnBlock();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BodyContext extends ParserRuleContext {
		public List<BlockContext> block() {
			return getRuleContexts(BlockContext.class);
		}
		public BlockContext block(int i) {
			return getRuleContext(BlockContext.class,i);
		}
		public List<FuncContext> func() {
			return getRuleContexts(FuncContext.class);
		}
		public FuncContext func(int i) {
			return getRuleContext(FuncContext.class,i);
		}
		public BodyContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_body; }
	}

	public final BodyContext body() throws RecognitionException {
		BodyContext _localctx = new BodyContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_body);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(177);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,12,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					setState(175);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,11,_ctx) ) {
					case 1:
						{
						setState(171);
						block();
						}
						break;
					case 2:
						{
						setState(172);
						func();
						setState(173);
						match(T__5);
						}
						break;
					}
					} 
				}
				setState(179);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,12,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlockContext extends ParserRuleContext {
		public InitialBlockContext initialBlock() {
			return getRuleContext(InitialBlockContext.class,0);
		}
		public ArrayInitBlockContext arrayInitBlock() {
			return getRuleContext(ArrayInitBlockContext.class,0);
		}
		public StructInitBlockContext structInitBlock() {
			return getRuleContext(StructInitBlockContext.class,0);
		}
		public AssignBlockContext assignBlock() {
			return getRuleContext(AssignBlockContext.class,0);
		}
		public IfBlocksContext ifBlocks() {
			return getRuleContext(IfBlocksContext.class,0);
		}
		public WhileBlockContext whileBlock() {
			return getRuleContext(WhileBlockContext.class,0);
		}
		public ForBlockContext forBlock() {
			return getRuleContext(ForBlockContext.class,0);
		}
		public ReturnBlockContext returnBlock() {
			return getRuleContext(ReturnBlockContext.class,0);
		}
		public BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_block; }
	}

	public final BlockContext block() throws RecognitionException {
		BlockContext _localctx = new BlockContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_block);
		try {
			setState(188);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,13,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(180);
				initialBlock();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(181);
				arrayInitBlock();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(182);
				structInitBlock();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(183);
				assignBlock();
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(184);
				ifBlocks();
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(185);
				whileBlock();
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(186);
				forBlock();
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(187);
				returnBlock();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class InitialBlockContext extends ParserRuleContext {
		public List<MIDContext> mID() {
			return getRuleContexts(MIDContext.class);
		}
		public MIDContext mID(int i) {
			return getRuleContext(MIDContext.class,i);
		}
		public MTypeContext mType() {
			return getRuleContext(MTypeContext.class,0);
		}
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public InitialBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_initialBlock; }
	}

	public final InitialBlockContext initialBlock() throws RecognitionException {
		InitialBlockContext _localctx = new InitialBlockContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_initialBlock);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(190);
			mType();
			}
			setState(191);
			mID();
			setState(194);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__9) {
				{
				setState(192);
				match(T__9);
				setState(193);
				expr(0);
				}
			}

			setState(204);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__6) {
				{
				{
				setState(196);
				match(T__6);
				setState(197);
				mID();
				setState(200);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__9) {
					{
					setState(198);
					match(T__9);
					setState(199);
					expr(0);
					}
				}

				}
				}
				setState(206);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(207);
			match(T__5);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ArrayInitBlockContext extends ParserRuleContext {
		public MTypeContext mType() {
			return getRuleContext(MTypeContext.class,0);
		}
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public MINTContext mINT() {
			return getRuleContext(MINTContext.class,0);
		}
		public ArrayInitBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_arrayInitBlock; }
	}

	public final ArrayInitBlockContext arrayInitBlock() throws RecognitionException {
		ArrayInitBlockContext _localctx = new ArrayInitBlockContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_arrayInitBlock);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(209);
			mType();
			setState(210);
			mID();
			setState(211);
			match(T__10);
			setState(212);
			mINT();
			setState(213);
			match(T__11);
			setState(214);
			match(T__5);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StructInitBlockContext extends ParserRuleContext {
		public MStructContext mStruct() {
			return getRuleContext(MStructContext.class,0);
		}
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public MArrayContext mArray() {
			return getRuleContext(MArrayContext.class,0);
		}
		public StructInitBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_structInitBlock; }
	}

	public final StructInitBlockContext structInitBlock() throws RecognitionException {
		StructInitBlockContext _localctx = new StructInitBlockContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_structInitBlock);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(216);
			mStruct();
			setState(219);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,17,_ctx) ) {
			case 1:
				{
				setState(217);
				mID();
				}
				break;
			case 2:
				{
				setState(218);
				mArray();
				}
				break;
			}
			setState(221);
			match(T__5);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class AssignBlockContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public List<ArrayItemContext> arrayItem() {
			return getRuleContexts(ArrayItemContext.class);
		}
		public ArrayItemContext arrayItem(int i) {
			return getRuleContext(ArrayItemContext.class,i);
		}
		public List<MIDContext> mID() {
			return getRuleContexts(MIDContext.class);
		}
		public MIDContext mID(int i) {
			return getRuleContext(MIDContext.class,i);
		}
		public List<StructMemberContext> structMember() {
			return getRuleContexts(StructMemberContext.class);
		}
		public StructMemberContext structMember(int i) {
			return getRuleContext(StructMemberContext.class,i);
		}
		public AssignBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_assignBlock; }
	}

	public final AssignBlockContext assignBlock() throws RecognitionException {
		AssignBlockContext _localctx = new AssignBlockContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_assignBlock);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(230); 
			_errHandler.sync(this);
			_alt = 1;
			do {
				switch (_alt) {
				case 1:
					{
					{
					setState(226);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,18,_ctx) ) {
					case 1:
						{
						setState(223);
						arrayItem();
						}
						break;
					case 2:
						{
						setState(224);
						mID();
						}
						break;
					case 3:
						{
						setState(225);
						structMember();
						}
						break;
					}
					setState(228);
					match(T__9);
					}
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(232); 
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,19,_ctx);
			} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
			setState(234);
			expr(0);
			setState(235);
			match(T__5);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class IfBlocksContext extends ParserRuleContext {
		public IfBlockContext ifBlock() {
			return getRuleContext(IfBlockContext.class,0);
		}
		public List<ElifBlockContext> elifBlock() {
			return getRuleContexts(ElifBlockContext.class);
		}
		public ElifBlockContext elifBlock(int i) {
			return getRuleContext(ElifBlockContext.class,i);
		}
		public ElseBlockContext elseBlock() {
			return getRuleContext(ElseBlockContext.class,0);
		}
		public IfBlocksContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_ifBlocks; }
	}

	public final IfBlocksContext ifBlocks() throws RecognitionException {
		IfBlocksContext _localctx = new IfBlocksContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_ifBlocks);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(237);
			ifBlock();
			setState(241);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,20,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(238);
					elifBlock();
					}
					} 
				}
				setState(243);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,20,_ctx);
			}
			setState(245);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__13) {
				{
				setState(244);
				elseBlock();
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class IfBlockContext extends ParserRuleContext {
		public ConditionContext condition() {
			return getRuleContext(ConditionContext.class,0);
		}
		public BodyContext body() {
			return getRuleContext(BodyContext.class,0);
		}
		public IfBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_ifBlock; }
	}

	public final IfBlockContext ifBlock() throws RecognitionException {
		IfBlockContext _localctx = new IfBlockContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_ifBlock);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(247);
			match(T__12);
			setState(248);
			match(T__7);
			setState(249);
			condition();
			setState(250);
			match(T__8);
			setState(251);
			match(T__3);
			setState(252);
			body();
			setState(253);
			match(T__4);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ElifBlockContext extends ParserRuleContext {
		public ConditionContext condition() {
			return getRuleContext(ConditionContext.class,0);
		}
		public BodyContext body() {
			return getRuleContext(BodyContext.class,0);
		}
		public ElifBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_elifBlock; }
	}

	public final ElifBlockContext elifBlock() throws RecognitionException {
		ElifBlockContext _localctx = new ElifBlockContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_elifBlock);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(255);
			match(T__13);
			setState(256);
			match(T__12);
			setState(257);
			match(T__7);
			setState(258);
			condition();
			setState(259);
			match(T__8);
			setState(260);
			match(T__3);
			setState(261);
			body();
			setState(262);
			match(T__4);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ElseBlockContext extends ParserRuleContext {
		public BodyContext body() {
			return getRuleContext(BodyContext.class,0);
		}
		public ElseBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_elseBlock; }
	}

	public final ElseBlockContext elseBlock() throws RecognitionException {
		ElseBlockContext _localctx = new ElseBlockContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_elseBlock);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(264);
			match(T__13);
			setState(265);
			match(T__3);
			setState(266);
			body();
			setState(267);
			match(T__4);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ConditionContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ConditionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_condition; }
	}

	public final ConditionContext condition() throws RecognitionException {
		ConditionContext _localctx = new ConditionContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_condition);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(269);
			expr(0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class WhileBlockContext extends ParserRuleContext {
		public ConditionContext condition() {
			return getRuleContext(ConditionContext.class,0);
		}
		public BodyContext body() {
			return getRuleContext(BodyContext.class,0);
		}
		public WhileBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_whileBlock; }
	}

	public final WhileBlockContext whileBlock() throws RecognitionException {
		WhileBlockContext _localctx = new WhileBlockContext(_ctx, getState());
		enterRule(_localctx, 38, RULE_whileBlock);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(271);
			match(T__14);
			setState(272);
			match(T__7);
			setState(273);
			condition();
			setState(274);
			match(T__8);
			setState(275);
			match(T__3);
			setState(276);
			body();
			setState(277);
			match(T__4);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ForBlockContext extends ParserRuleContext {
		public For1BlockContext for1Block() {
			return getRuleContext(For1BlockContext.class,0);
		}
		public ConditionContext condition() {
			return getRuleContext(ConditionContext.class,0);
		}
		public For3BlockContext for3Block() {
			return getRuleContext(For3BlockContext.class,0);
		}
		public BodyContext body() {
			return getRuleContext(BodyContext.class,0);
		}
		public ForBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_forBlock; }
	}

	public final ForBlockContext forBlock() throws RecognitionException {
		ForBlockContext _localctx = new ForBlockContext(_ctx, getState());
		enterRule(_localctx, 40, RULE_forBlock);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(279);
			match(T__15);
			setState(280);
			match(T__7);
			setState(281);
			for1Block();
			setState(282);
			match(T__5);
			setState(283);
			condition();
			setState(284);
			match(T__5);
			setState(285);
			for3Block();
			setState(286);
			match(T__8);
			setState(292);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__3:
				{
				setState(287);
				match(T__3);
				setState(288);
				body();
				setState(289);
				match(T__4);
				}
				break;
			case T__5:
				{
				setState(291);
				match(T__5);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class For1BlockContext extends ParserRuleContext {
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public For1BlockContext for1Block() {
			return getRuleContext(For1BlockContext.class,0);
		}
		public For1BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_for1Block; }
	}

	public final For1BlockContext for1Block() throws RecognitionException {
		For1BlockContext _localctx = new For1BlockContext(_ctx, getState());
		enterRule(_localctx, 42, RULE_for1Block);
		int _la;
		try {
			setState(302);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case ID:
				enterOuterAlt(_localctx, 1);
				{
				setState(294);
				mID();
				setState(295);
				match(T__9);
				setState(296);
				expr(0);
				setState(299);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__6) {
					{
					setState(297);
					match(T__6);
					setState(298);
					for1Block();
					}
				}

				}
				break;
			case T__5:
				enterOuterAlt(_localctx, 2);
				{
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class For3BlockContext extends ParserRuleContext {
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public For3BlockContext for3Block() {
			return getRuleContext(For3BlockContext.class,0);
		}
		public For3BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_for3Block; }
	}

	public final For3BlockContext for3Block() throws RecognitionException {
		For3BlockContext _localctx = new For3BlockContext(_ctx, getState());
		enterRule(_localctx, 44, RULE_for3Block);
		int _la;
		try {
			setState(312);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case ID:
				enterOuterAlt(_localctx, 1);
				{
				setState(304);
				mID();
				setState(305);
				match(T__9);
				setState(306);
				expr(0);
				setState(309);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__6) {
					{
					setState(307);
					match(T__6);
					setState(308);
					for3Block();
					}
				}

				}
				break;
			case T__8:
				enterOuterAlt(_localctx, 2);
				{
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReturnBlockContext extends ParserRuleContext {
		public MINTContext mINT() {
			return getRuleContext(MINTContext.class,0);
		}
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public ReturnBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_returnBlock; }
	}

	public final ReturnBlockContext returnBlock() throws RecognitionException {
		ReturnBlockContext _localctx = new ReturnBlockContext(_ctx, getState());
		enterRule(_localctx, 46, RULE_returnBlock);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(314);
			match(T__16);
			setState(317);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case INT:
				{
				setState(315);
				mINT();
				}
				break;
			case ID:
				{
				setState(316);
				mID();
				}
				break;
			case T__5:
				break;
			default:
				break;
			}
			setState(319);
			match(T__5);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExprContext extends ParserRuleContext {
		public ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expr; }
	 
		public ExprContext() { }
		public void copyFrom(ExprContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class IdentifierContext extends ExprContext {
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public IdentifierContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class ParensContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ParensContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class ORContext extends ExprContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public ORContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class StringContext extends ExprContext {
		public MSTRINGContext mSTRING() {
			return getRuleContext(MSTRINGContext.class,0);
		}
		public StringContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class MulDivContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public MulDivContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class AddSubContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public AddSubContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class DoubleContext extends ExprContext {
		public Token op;
		public MDOUBLEContext mDOUBLE() {
			return getRuleContext(MDOUBLEContext.class,0);
		}
		public DoubleContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class IntContext extends ExprContext {
		public Token op;
		public MINTContext mINT() {
			return getRuleContext(MINTContext.class,0);
		}
		public IntContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class NegContext extends ExprContext {
		public Token op;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public NegContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class ArrayitemContext extends ExprContext {
		public ArrayItemContext arrayItem() {
			return getRuleContext(ArrayItemContext.class,0);
		}
		public ArrayitemContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class FunctionContext extends ExprContext {
		public FuncContext func() {
			return getRuleContext(FuncContext.class,0);
		}
		public FunctionContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class ANDContext extends ExprContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public ANDContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class CharContext extends ExprContext {
		public MCHARContext mCHAR() {
			return getRuleContext(MCHARContext.class,0);
		}
		public CharContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class StructmemberContext extends ExprContext {
		public StructMemberContext structMember() {
			return getRuleContext(StructMemberContext.class,0);
		}
		public StructmemberContext(ExprContext ctx) { copyFrom(ctx); }
	}
	public static class JudgeContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public JudgeContext(ExprContext ctx) { copyFrom(ctx); }
	}

	public final ExprContext expr() throws RecognitionException {
		return expr(0);
	}

	private ExprContext expr(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(_ctx, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 48;
		enterRecursionRule(_localctx, 48, RULE_expr, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(342);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,30,_ctx) ) {
			case 1:
				{
				_localctx = new ParensContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(322);
				match(T__7);
				setState(323);
				expr(0);
				setState(324);
				match(T__8);
				}
				break;
			case 2:
				{
				_localctx = new NegContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(326);
				((NegContext)_localctx).op = match(T__17);
				setState(327);
				expr(14);
				}
				break;
			case 3:
				{
				_localctx = new ArrayitemContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(328);
				arrayItem();
				}
				break;
			case 4:
				{
				_localctx = new StructmemberContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(329);
				structMember();
				}
				break;
			case 5:
				{
				_localctx = new IntContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(331);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__22) {
					{
					setState(330);
					((IntContext)_localctx).op = match(T__22);
					}
				}

				setState(333);
				mINT();
				}
				break;
			case 6:
				{
				_localctx = new DoubleContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(335);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__22) {
					{
					setState(334);
					((DoubleContext)_localctx).op = match(T__22);
					}
				}

				setState(337);
				mDOUBLE();
				}
				break;
			case 7:
				{
				_localctx = new CharContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(338);
				mCHAR();
				}
				break;
			case 8:
				{
				_localctx = new StringContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(339);
				mSTRING();
				}
				break;
			case 9:
				{
				_localctx = new IdentifierContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(340);
				mID();
				}
				break;
			case 10:
				{
				_localctx = new FunctionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(341);
				func();
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(361);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,32,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(359);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,31,_ctx) ) {
					case 1:
						{
						_localctx = new MulDivContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(344);
						if (!(precpred(_ctx, 13))) throw new FailedPredicateException(this, "precpred(_ctx, 13)");
						setState(345);
						((MulDivContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__18) | (1L << T__19) | (1L << T__20))) != 0)) ) {
							((MulDivContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(346);
						expr(14);
						}
						break;
					case 2:
						{
						_localctx = new AddSubContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(347);
						if (!(precpred(_ctx, 12))) throw new FailedPredicateException(this, "precpred(_ctx, 12)");
						setState(348);
						((AddSubContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__21 || _la==T__22) ) {
							((AddSubContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(349);
						expr(13);
						}
						break;
					case 3:
						{
						_localctx = new JudgeContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(350);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(351);
						((JudgeContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__2) | (1L << T__23) | (1L << T__24) | (1L << T__25) | (1L << T__26))) != 0)) ) {
							((JudgeContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(352);
						expr(12);
						}
						break;
					case 4:
						{
						_localctx = new ANDContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(353);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(354);
						match(T__27);
						setState(355);
						expr(11);
						}
						break;
					case 5:
						{
						_localctx = new ORContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(356);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(357);
						match(T__28);
						setState(358);
						expr(10);
						}
						break;
					}
					} 
				}
				setState(363);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,32,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class MTypeContext extends ParserRuleContext {
		public MTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mType; }
	}

	public final MTypeContext mType() throws RecognitionException {
		MTypeContext _localctx = new MTypeContext(_ctx, getState());
		enterRule(_localctx, 50, RULE_mType);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(364);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__29) | (1L << T__30) | (1L << T__31) | (1L << T__32))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MArrayContext extends ParserRuleContext {
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public MINTContext mINT() {
			return getRuleContext(MINTContext.class,0);
		}
		public MArrayContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mArray; }
	}

	public final MArrayContext mArray() throws RecognitionException {
		MArrayContext _localctx = new MArrayContext(_ctx, getState());
		enterRule(_localctx, 52, RULE_mArray);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(366);
			mID();
			setState(367);
			match(T__10);
			setState(368);
			mINT();
			setState(369);
			match(T__11);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MVoidContext extends ParserRuleContext {
		public MVoidContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mVoid; }
	}

	public final MVoidContext mVoid() throws RecognitionException {
		MVoidContext _localctx = new MVoidContext(_ctx, getState());
		enterRule(_localctx, 54, RULE_mVoid);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(371);
			match(T__33);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MStructContext extends ParserRuleContext {
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public MStructContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mStruct; }
	}

	public final MStructContext mStruct() throws RecognitionException {
		MStructContext _localctx = new MStructContext(_ctx, getState());
		enterRule(_localctx, 56, RULE_mStruct);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(373);
			match(T__34);
			setState(374);
			mID();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StructMemberContext extends ParserRuleContext {
		public List<MIDContext> mID() {
			return getRuleContexts(MIDContext.class);
		}
		public MIDContext mID(int i) {
			return getRuleContext(MIDContext.class,i);
		}
		public List<ArrayItemContext> arrayItem() {
			return getRuleContexts(ArrayItemContext.class);
		}
		public ArrayItemContext arrayItem(int i) {
			return getRuleContext(ArrayItemContext.class,i);
		}
		public StructMemberContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_structMember; }
	}

	public final StructMemberContext structMember() throws RecognitionException {
		StructMemberContext _localctx = new StructMemberContext(_ctx, getState());
		enterRule(_localctx, 58, RULE_structMember);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(378);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,33,_ctx) ) {
			case 1:
				{
				setState(376);
				mID();
				}
				break;
			case 2:
				{
				setState(377);
				arrayItem();
				}
				break;
			}
			setState(380);
			match(T__35);
			setState(383);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,34,_ctx) ) {
			case 1:
				{
				setState(381);
				mID();
				}
				break;
			case 2:
				{
				setState(382);
				arrayItem();
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ArrayItemContext extends ParserRuleContext {
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ArrayItemContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_arrayItem; }
	}

	public final ArrayItemContext arrayItem() throws RecognitionException {
		ArrayItemContext _localctx = new ArrayItemContext(_ctx, getState());
		enterRule(_localctx, 60, RULE_arrayItem);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(385);
			mID();
			setState(386);
			match(T__10);
			setState(387);
			expr(0);
			setState(388);
			match(T__11);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FuncContext extends ParserRuleContext {
		public StrlenFuncContext strlenFunc() {
			return getRuleContext(StrlenFuncContext.class,0);
		}
		public AtoiFuncContext atoiFunc() {
			return getRuleContext(AtoiFuncContext.class,0);
		}
		public PrintfFuncContext printfFunc() {
			return getRuleContext(PrintfFuncContext.class,0);
		}
		public ScanfFuncContext scanfFunc() {
			return getRuleContext(ScanfFuncContext.class,0);
		}
		public GetsFuncContext getsFunc() {
			return getRuleContext(GetsFuncContext.class,0);
		}
		public SelfDefinedFuncContext selfDefinedFunc() {
			return getRuleContext(SelfDefinedFuncContext.class,0);
		}
		public FuncContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_func; }
	}

	public final FuncContext func() throws RecognitionException {
		FuncContext _localctx = new FuncContext(_ctx, getState());
		enterRule(_localctx, 62, RULE_func);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(396);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__36:
				{
				setState(390);
				strlenFunc();
				}
				break;
			case T__37:
				{
				setState(391);
				atoiFunc();
				}
				break;
			case T__38:
				{
				setState(392);
				printfFunc();
				}
				break;
			case T__39:
				{
				setState(393);
				scanfFunc();
				}
				break;
			case T__41:
				{
				setState(394);
				getsFunc();
				}
				break;
			case ID:
				{
				setState(395);
				selfDefinedFunc();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StrlenFuncContext extends ParserRuleContext {
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public StrlenFuncContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_strlenFunc; }
	}

	public final StrlenFuncContext strlenFunc() throws RecognitionException {
		StrlenFuncContext _localctx = new StrlenFuncContext(_ctx, getState());
		enterRule(_localctx, 64, RULE_strlenFunc);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(398);
			match(T__36);
			setState(399);
			match(T__7);
			setState(400);
			mID();
			setState(401);
			match(T__8);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class AtoiFuncContext extends ParserRuleContext {
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public AtoiFuncContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_atoiFunc; }
	}

	public final AtoiFuncContext atoiFunc() throws RecognitionException {
		AtoiFuncContext _localctx = new AtoiFuncContext(_ctx, getState());
		enterRule(_localctx, 66, RULE_atoiFunc);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(403);
			match(T__37);
			setState(404);
			match(T__7);
			setState(405);
			mID();
			setState(406);
			match(T__8);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class PrintfFuncContext extends ParserRuleContext {
		public MSTRINGContext mSTRING() {
			return getRuleContext(MSTRINGContext.class,0);
		}
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public PrintfFuncContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_printfFunc; }
	}

	public final PrintfFuncContext printfFunc() throws RecognitionException {
		PrintfFuncContext _localctx = new PrintfFuncContext(_ctx, getState());
		enterRule(_localctx, 68, RULE_printfFunc);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(408);
			match(T__38);
			setState(409);
			match(T__7);
			setState(412);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case STRING:
				{
				setState(410);
				mSTRING();
				}
				break;
			case ID:
				{
				setState(411);
				mID();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(418);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__6) {
				{
				{
				setState(414);
				match(T__6);
				setState(415);
				expr(0);
				}
				}
				setState(420);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(421);
			match(T__8);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ScanfFuncContext extends ParserRuleContext {
		public MSTRINGContext mSTRING() {
			return getRuleContext(MSTRINGContext.class,0);
		}
		public List<MIDContext> mID() {
			return getRuleContexts(MIDContext.class);
		}
		public MIDContext mID(int i) {
			return getRuleContext(MIDContext.class,i);
		}
		public List<ArrayItemContext> arrayItem() {
			return getRuleContexts(ArrayItemContext.class);
		}
		public ArrayItemContext arrayItem(int i) {
			return getRuleContext(ArrayItemContext.class,i);
		}
		public List<StructMemberContext> structMember() {
			return getRuleContexts(StructMemberContext.class);
		}
		public StructMemberContext structMember(int i) {
			return getRuleContext(StructMemberContext.class,i);
		}
		public ScanfFuncContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_scanfFunc; }
	}

	public final ScanfFuncContext scanfFunc() throws RecognitionException {
		ScanfFuncContext _localctx = new ScanfFuncContext(_ctx, getState());
		enterRule(_localctx, 70, RULE_scanfFunc);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(423);
			match(T__39);
			setState(424);
			match(T__7);
			setState(425);
			mSTRING();
			setState(437);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__6) {
				{
				{
				setState(426);
				match(T__6);
				setState(428);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__40) {
					{
					setState(427);
					match(T__40);
					}
				}

				setState(433);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,39,_ctx) ) {
				case 1:
					{
					setState(430);
					mID();
					}
					break;
				case 2:
					{
					setState(431);
					arrayItem();
					}
					break;
				case 3:
					{
					setState(432);
					structMember();
					}
					break;
				}
				}
				}
				setState(439);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(440);
			match(T__8);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class GetsFuncContext extends ParserRuleContext {
		public MIDContext mID() {
			return getRuleContext(MIDContext.class,0);
		}
		public GetsFuncContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_getsFunc; }
	}

	public final GetsFuncContext getsFunc() throws RecognitionException {
		GetsFuncContext _localctx = new GetsFuncContext(_ctx, getState());
		enterRule(_localctx, 72, RULE_getsFunc);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(442);
			match(T__41);
			setState(443);
			match(T__7);
			setState(444);
			mID();
			setState(445);
			match(T__8);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class SelfDefinedFuncContext extends ParserRuleContext {
		public List<MIDContext> mID() {
			return getRuleContexts(MIDContext.class);
		}
		public MIDContext mID(int i) {
			return getRuleContext(MIDContext.class,i);
		}
		public List<ArgumentContext> argument() {
			return getRuleContexts(ArgumentContext.class);
		}
		public ArgumentContext argument(int i) {
			return getRuleContext(ArgumentContext.class,i);
		}
		public SelfDefinedFuncContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_selfDefinedFunc; }
	}

	public final SelfDefinedFuncContext selfDefinedFunc() throws RecognitionException {
		SelfDefinedFuncContext _localctx = new SelfDefinedFuncContext(_ctx, getState());
		enterRule(_localctx, 74, RULE_selfDefinedFunc);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(447);
			mID();
			setState(448);
			match(T__7);
			setState(463);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ID) | (1L << INT) | (1L << DOUBLE) | (1L << CHAR) | (1L << STRING))) != 0)) {
				{
				setState(451);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case INT:
				case DOUBLE:
				case CHAR:
				case STRING:
					{
					setState(449);
					argument();
					}
					break;
				case ID:
					{
					setState(450);
					mID();
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(460);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__6) {
					{
					{
					setState(453);
					match(T__6);
					setState(456);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case INT:
					case DOUBLE:
					case CHAR:
					case STRING:
						{
						setState(454);
						argument();
						}
						break;
					case ID:
						{
						setState(455);
						mID();
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					}
					}
					setState(462);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
			}

			setState(465);
			match(T__8);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ArgumentContext extends ParserRuleContext {
		public MINTContext mINT() {
			return getRuleContext(MINTContext.class,0);
		}
		public MDOUBLEContext mDOUBLE() {
			return getRuleContext(MDOUBLEContext.class,0);
		}
		public MCHARContext mCHAR() {
			return getRuleContext(MCHARContext.class,0);
		}
		public MSTRINGContext mSTRING() {
			return getRuleContext(MSTRINGContext.class,0);
		}
		public ArgumentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_argument; }
	}

	public final ArgumentContext argument() throws RecognitionException {
		ArgumentContext _localctx = new ArgumentContext(_ctx, getState());
		enterRule(_localctx, 76, RULE_argument);
		try {
			setState(471);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case INT:
				enterOuterAlt(_localctx, 1);
				{
				setState(467);
				mINT();
				}
				break;
			case DOUBLE:
				enterOuterAlt(_localctx, 2);
				{
				setState(468);
				mDOUBLE();
				}
				break;
			case CHAR:
				enterOuterAlt(_localctx, 3);
				{
				setState(469);
				mCHAR();
				}
				break;
			case STRING:
				enterOuterAlt(_localctx, 4);
				{
				setState(470);
				mSTRING();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MIDContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(simpleCParser.ID, 0); }
		public MIDContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mID; }
	}

	public final MIDContext mID() throws RecognitionException {
		MIDContext _localctx = new MIDContext(_ctx, getState());
		enterRule(_localctx, 78, RULE_mID);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(473);
			match(ID);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MINTContext extends ParserRuleContext {
		public TerminalNode INT() { return getToken(simpleCParser.INT, 0); }
		public MINTContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mINT; }
	}

	public final MINTContext mINT() throws RecognitionException {
		MINTContext _localctx = new MINTContext(_ctx, getState());
		enterRule(_localctx, 80, RULE_mINT);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(475);
			match(INT);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MDOUBLEContext extends ParserRuleContext {
		public TerminalNode DOUBLE() { return getToken(simpleCParser.DOUBLE, 0); }
		public MDOUBLEContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mDOUBLE; }
	}

	public final MDOUBLEContext mDOUBLE() throws RecognitionException {
		MDOUBLEContext _localctx = new MDOUBLEContext(_ctx, getState());
		enterRule(_localctx, 82, RULE_mDOUBLE);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(477);
			match(DOUBLE);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MCHARContext extends ParserRuleContext {
		public TerminalNode CHAR() { return getToken(simpleCParser.CHAR, 0); }
		public MCHARContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mCHAR; }
	}

	public final MCHARContext mCHAR() throws RecognitionException {
		MCHARContext _localctx = new MCHARContext(_ctx, getState());
		enterRule(_localctx, 84, RULE_mCHAR);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(479);
			match(CHAR);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MSTRINGContext extends ParserRuleContext {
		public TerminalNode STRING() { return getToken(simpleCParser.STRING, 0); }
		public MSTRINGContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mSTRING; }
	}

	public final MSTRINGContext mSTRING() throws RecognitionException {
		MSTRINGContext _localctx = new MSTRINGContext(_ctx, getState());
		enterRule(_localctx, 86, RULE_mSTRING);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(481);
			match(STRING);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MLIBContext extends ParserRuleContext {
		public TerminalNode LIB() { return getToken(simpleCParser.LIB, 0); }
		public MLIBContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mLIB; }
	}

	public final MLIBContext mLIB() throws RecognitionException {
		MLIBContext _localctx = new MLIBContext(_ctx, getState());
		enterRule(_localctx, 88, RULE_mLIB);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(483);
			match(LIB);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 24:
			return expr_sempred((ExprContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 13);
		case 1:
			return precpred(_ctx, 12);
		case 2:
			return precpred(_ctx, 11);
		case 3:
			return precpred(_ctx, 10);
		case 4:
			return precpred(_ctx, 9);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\67\u01e8\4\2\t\2"+
		"\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\3\2\7\2^\n\2\f\2\16\2a\13\2\3\2\3\2\3\2\3\2\3\2\7\2h"+
		"\n\2\f\2\16\2k\13\2\3\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\6\4u\n\4\r\4\16\4"+
		"v\3\4\3\4\3\4\3\5\3\5\5\5~\n\5\3\5\3\5\5\5\u0082\n\5\3\5\3\5\3\5\5\5\u0087"+
		"\n\5\7\5\u0089\n\5\f\5\16\5\u008c\13\5\3\5\3\5\3\6\3\6\3\6\5\6\u0093\n"+
		"\6\3\6\3\6\3\6\3\6\3\6\3\6\3\6\3\6\3\7\3\7\3\7\7\7\u00a0\n\7\f\7\16\7"+
		"\u00a3\13\7\3\7\5\7\u00a6\n\7\3\b\3\b\3\b\3\t\3\t\3\t\3\n\3\n\3\n\3\n"+
		"\7\n\u00b2\n\n\f\n\16\n\u00b5\13\n\3\13\3\13\3\13\3\13\3\13\3\13\3\13"+
		"\3\13\5\13\u00bf\n\13\3\f\3\f\3\f\3\f\5\f\u00c5\n\f\3\f\3\f\3\f\3\f\5"+
		"\f\u00cb\n\f\7\f\u00cd\n\f\f\f\16\f\u00d0\13\f\3\f\3\f\3\r\3\r\3\r\3\r"+
		"\3\r\3\r\3\r\3\16\3\16\3\16\5\16\u00de\n\16\3\16\3\16\3\17\3\17\3\17\5"+
		"\17\u00e5\n\17\3\17\3\17\6\17\u00e9\n\17\r\17\16\17\u00ea\3\17\3\17\3"+
		"\17\3\20\3\20\7\20\u00f2\n\20\f\20\16\20\u00f5\13\20\3\20\5\20\u00f8\n"+
		"\20\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\22\3\22\3\22\3\22\3\22\3"+
		"\22\3\22\3\22\3\22\3\23\3\23\3\23\3\23\3\23\3\24\3\24\3\25\3\25\3\25\3"+
		"\25\3\25\3\25\3\25\3\25\3\26\3\26\3\26\3\26\3\26\3\26\3\26\3\26\3\26\3"+
		"\26\3\26\3\26\3\26\5\26\u0127\n\26\3\27\3\27\3\27\3\27\3\27\5\27\u012e"+
		"\n\27\3\27\5\27\u0131\n\27\3\30\3\30\3\30\3\30\3\30\5\30\u0138\n\30\3"+
		"\30\5\30\u013b\n\30\3\31\3\31\3\31\5\31\u0140\n\31\3\31\3\31\3\32\3\32"+
		"\3\32\3\32\3\32\3\32\3\32\3\32\3\32\3\32\5\32\u014e\n\32\3\32\3\32\5\32"+
		"\u0152\n\32\3\32\3\32\3\32\3\32\3\32\5\32\u0159\n\32\3\32\3\32\3\32\3"+
		"\32\3\32\3\32\3\32\3\32\3\32\3\32\3\32\3\32\3\32\3\32\3\32\7\32\u016a"+
		"\n\32\f\32\16\32\u016d\13\32\3\33\3\33\3\34\3\34\3\34\3\34\3\34\3\35\3"+
		"\35\3\36\3\36\3\36\3\37\3\37\5\37\u017d\n\37\3\37\3\37\3\37\5\37\u0182"+
		"\n\37\3 \3 \3 \3 \3 \3!\3!\3!\3!\3!\3!\5!\u018f\n!\3\"\3\"\3\"\3\"\3\""+
		"\3#\3#\3#\3#\3#\3$\3$\3$\3$\5$\u019f\n$\3$\3$\7$\u01a3\n$\f$\16$\u01a6"+
		"\13$\3$\3$\3%\3%\3%\3%\3%\5%\u01af\n%\3%\3%\3%\5%\u01b4\n%\7%\u01b6\n"+
		"%\f%\16%\u01b9\13%\3%\3%\3&\3&\3&\3&\3&\3\'\3\'\3\'\3\'\5\'\u01c6\n\'"+
		"\3\'\3\'\3\'\5\'\u01cb\n\'\7\'\u01cd\n\'\f\'\16\'\u01d0\13\'\5\'\u01d2"+
		"\n\'\3\'\3\'\3(\3(\3(\3(\5(\u01da\n(\3)\3)\3*\3*\3+\3+\3,\3,\3-\3-\3."+
		"\3.\3.\2\3\62/\2\4\6\b\n\f\16\20\22\24\26\30\32\34\36 \"$&(*,.\60\62\64"+
		"\668:<>@BDFHJLNPRTVXZ\2\6\3\2\25\27\3\2\30\31\4\2\4\5\32\35\3\2 #\2\u0206"+
		"\2_\3\2\2\2\4l\3\2\2\2\6q\3\2\2\2\b}\3\2\2\2\n\u0092\3\2\2\2\f\u00a5\3"+
		"\2\2\2\16\u00a7\3\2\2\2\20\u00aa\3\2\2\2\22\u00b3\3\2\2\2\24\u00be\3\2"+
		"\2\2\26\u00c0\3\2\2\2\30\u00d3\3\2\2\2\32\u00da\3\2\2\2\34\u00e8\3\2\2"+
		"\2\36\u00ef\3\2\2\2 \u00f9\3\2\2\2\"\u0101\3\2\2\2$\u010a\3\2\2\2&\u010f"+
		"\3\2\2\2(\u0111\3\2\2\2*\u0119\3\2\2\2,\u0130\3\2\2\2.\u013a\3\2\2\2\60"+
		"\u013c\3\2\2\2\62\u0158\3\2\2\2\64\u016e\3\2\2\2\66\u0170\3\2\2\28\u0175"+
		"\3\2\2\2:\u0177\3\2\2\2<\u017c\3\2\2\2>\u0183\3\2\2\2@\u018e\3\2\2\2B"+
		"\u0190\3\2\2\2D\u0195\3\2\2\2F\u019a\3\2\2\2H\u01a9\3\2\2\2J\u01bc\3\2"+
		"\2\2L\u01c1\3\2\2\2N\u01d9\3\2\2\2P\u01db\3\2\2\2R\u01dd\3\2\2\2T\u01df"+
		"\3\2\2\2V\u01e1\3\2\2\2X\u01e3\3\2\2\2Z\u01e5\3\2\2\2\\^\5\4\3\2]\\\3"+
		"\2\2\2^a\3\2\2\2_]\3\2\2\2_`\3\2\2\2`i\3\2\2\2a_\3\2\2\2bh\5\26\f\2ch"+
		"\5\30\r\2dh\5\32\16\2eh\5\6\4\2fh\5\n\6\2gb\3\2\2\2gc\3\2\2\2gd\3\2\2"+
		"\2ge\3\2\2\2gf\3\2\2\2hk\3\2\2\2ig\3\2\2\2ij\3\2\2\2j\3\3\2\2\2ki\3\2"+
		"\2\2lm\7\3\2\2mn\7\4\2\2no\5Z.\2op\7\5\2\2p\5\3\2\2\2qr\5:\36\2rt\7\6"+
		"\2\2su\5\b\5\2ts\3\2\2\2uv\3\2\2\2vt\3\2\2\2vw\3\2\2\2wx\3\2\2\2xy\7\7"+
		"\2\2yz\7\b\2\2z\7\3\2\2\2{~\5\64\33\2|~\5:\36\2}{\3\2\2\2}|\3\2\2\2~\u0081"+
		"\3\2\2\2\177\u0082\5P)\2\u0080\u0082\5\66\34\2\u0081\177\3\2\2\2\u0081"+
		"\u0080\3\2\2\2\u0082\u008a\3\2\2\2\u0083\u0086\7\t\2\2\u0084\u0087\5P"+
		")\2\u0085\u0087\5\66\34\2\u0086\u0084\3\2\2\2\u0086\u0085\3\2\2\2\u0087"+
		"\u0089\3\2\2\2\u0088\u0083\3\2\2\2\u0089\u008c\3\2\2\2\u008a\u0088\3\2"+
		"\2\2\u008a\u008b\3\2\2\2\u008b\u008d\3\2\2\2\u008c\u008a\3\2\2\2\u008d"+
		"\u008e\7\b\2\2\u008e\t\3\2\2\2\u008f\u0093\5\64\33\2\u0090\u0093\58\35"+
		"\2\u0091\u0093\5:\36\2\u0092\u008f\3\2\2\2\u0092\u0090\3\2\2\2\u0092\u0091"+
		"\3\2\2\2\u0093\u0094\3\2\2\2\u0094\u0095\5P)\2\u0095\u0096\7\n\2\2\u0096"+
		"\u0097\5\f\7\2\u0097\u0098\7\13\2\2\u0098\u0099\7\6\2\2\u0099\u009a\5"+
		"\20\t\2\u009a\u009b\7\7\2\2\u009b\13\3\2\2\2\u009c\u00a1\5\16\b\2\u009d"+
		"\u009e\7\t\2\2\u009e\u00a0\5\16\b\2\u009f\u009d\3\2\2\2\u00a0\u00a3\3"+
		"\2\2\2\u00a1\u009f\3\2\2\2\u00a1\u00a2\3\2\2\2\u00a2\u00a6\3\2\2\2\u00a3"+
		"\u00a1\3\2\2\2\u00a4\u00a6\3\2\2\2\u00a5\u009c\3\2\2\2\u00a5\u00a4\3\2"+
		"\2\2\u00a6\r\3\2\2\2\u00a7\u00a8\5\64\33\2\u00a8\u00a9\5P)\2\u00a9\17"+
		"\3\2\2\2\u00aa\u00ab\5\22\n\2\u00ab\u00ac\5\60\31\2\u00ac\21\3\2\2\2\u00ad"+
		"\u00b2\5\24\13\2\u00ae\u00af\5@!\2\u00af\u00b0\7\b\2\2\u00b0\u00b2\3\2"+
		"\2\2\u00b1\u00ad\3\2\2\2\u00b1\u00ae\3\2\2\2\u00b2\u00b5\3\2\2\2\u00b3"+
		"\u00b1\3\2\2\2\u00b3\u00b4\3\2\2\2\u00b4\23\3\2\2\2\u00b5\u00b3\3\2\2"+
		"\2\u00b6\u00bf\5\26\f\2\u00b7\u00bf\5\30\r\2\u00b8\u00bf\5\32\16\2\u00b9"+
		"\u00bf\5\34\17\2\u00ba\u00bf\5\36\20\2\u00bb\u00bf\5(\25\2\u00bc\u00bf"+
		"\5*\26\2\u00bd\u00bf\5\60\31\2\u00be\u00b6\3\2\2\2\u00be\u00b7\3\2\2\2"+
		"\u00be\u00b8\3\2\2\2\u00be\u00b9\3\2\2\2\u00be\u00ba\3\2\2\2\u00be\u00bb"+
		"\3\2\2\2\u00be\u00bc\3\2\2\2\u00be\u00bd\3\2\2\2\u00bf\25\3\2\2\2\u00c0"+
		"\u00c1\5\64\33\2\u00c1\u00c4\5P)\2\u00c2\u00c3\7\f\2\2\u00c3\u00c5\5\62"+
		"\32\2\u00c4\u00c2\3\2\2\2\u00c4\u00c5\3\2\2\2\u00c5\u00ce\3\2\2\2\u00c6"+
		"\u00c7\7\t\2\2\u00c7\u00ca\5P)\2\u00c8\u00c9\7\f\2\2\u00c9\u00cb\5\62"+
		"\32\2\u00ca\u00c8\3\2\2\2\u00ca\u00cb\3\2\2\2\u00cb\u00cd\3\2\2\2\u00cc"+
		"\u00c6\3\2\2\2\u00cd\u00d0\3\2\2\2\u00ce\u00cc\3\2\2\2\u00ce\u00cf\3\2"+
		"\2\2\u00cf\u00d1\3\2\2\2\u00d0\u00ce\3\2\2\2\u00d1\u00d2\7\b\2\2\u00d2"+
		"\27\3\2\2\2\u00d3\u00d4\5\64\33\2\u00d4\u00d5\5P)\2\u00d5\u00d6\7\r\2"+
		"\2\u00d6\u00d7\5R*\2\u00d7\u00d8\7\16\2\2\u00d8\u00d9\7\b\2\2\u00d9\31"+
		"\3\2\2\2\u00da\u00dd\5:\36\2\u00db\u00de\5P)\2\u00dc\u00de\5\66\34\2\u00dd"+
		"\u00db\3\2\2\2\u00dd\u00dc\3\2\2\2\u00de\u00df\3\2\2\2\u00df\u00e0\7\b"+
		"\2\2\u00e0\33\3\2\2\2\u00e1\u00e5\5> \2\u00e2\u00e5\5P)\2\u00e3\u00e5"+
		"\5<\37\2\u00e4\u00e1\3\2\2\2\u00e4\u00e2\3\2\2\2\u00e4\u00e3\3\2\2\2\u00e5"+
		"\u00e6\3\2\2\2\u00e6\u00e7\7\f\2\2\u00e7\u00e9\3\2\2\2\u00e8\u00e4\3\2"+
		"\2\2\u00e9\u00ea\3\2\2\2\u00ea\u00e8\3\2\2\2\u00ea\u00eb\3\2\2\2\u00eb"+
		"\u00ec\3\2\2\2\u00ec\u00ed\5\62\32\2\u00ed\u00ee\7\b\2\2\u00ee\35\3\2"+
		"\2\2\u00ef\u00f3\5 \21\2\u00f0\u00f2\5\"\22\2\u00f1\u00f0\3\2\2\2\u00f2"+
		"\u00f5\3\2\2\2\u00f3\u00f1\3\2\2\2\u00f3\u00f4\3\2\2\2\u00f4\u00f7\3\2"+
		"\2\2\u00f5\u00f3\3\2\2\2\u00f6\u00f8\5$\23\2\u00f7\u00f6\3\2\2\2\u00f7"+
		"\u00f8\3\2\2\2\u00f8\37\3\2\2\2\u00f9\u00fa\7\17\2\2\u00fa\u00fb\7\n\2"+
		"\2\u00fb\u00fc\5&\24\2\u00fc\u00fd\7\13\2\2\u00fd\u00fe\7\6\2\2\u00fe"+
		"\u00ff\5\22\n\2\u00ff\u0100\7\7\2\2\u0100!\3\2\2\2\u0101\u0102\7\20\2"+
		"\2\u0102\u0103\7\17\2\2\u0103\u0104\7\n\2\2\u0104\u0105\5&\24\2\u0105"+
		"\u0106\7\13\2\2\u0106\u0107\7\6\2\2\u0107\u0108\5\22\n\2\u0108\u0109\7"+
		"\7\2\2\u0109#\3\2\2\2\u010a\u010b\7\20\2\2\u010b\u010c\7\6\2\2\u010c\u010d"+
		"\5\22\n\2\u010d\u010e\7\7\2\2\u010e%\3\2\2\2\u010f\u0110\5\62\32\2\u0110"+
		"\'\3\2\2\2\u0111\u0112\7\21\2\2\u0112\u0113\7\n\2\2\u0113\u0114\5&\24"+
		"\2\u0114\u0115\7\13\2\2\u0115\u0116\7\6\2\2\u0116\u0117\5\22\n\2\u0117"+
		"\u0118\7\7\2\2\u0118)\3\2\2\2\u0119\u011a\7\22\2\2\u011a\u011b\7\n\2\2"+
		"\u011b\u011c\5,\27\2\u011c\u011d\7\b\2\2\u011d\u011e\5&\24\2\u011e\u011f"+
		"\7\b\2\2\u011f\u0120\5.\30\2\u0120\u0126\7\13\2\2\u0121\u0122\7\6\2\2"+
		"\u0122\u0123\5\22\n\2\u0123\u0124\7\7\2\2\u0124\u0127\3\2\2\2\u0125\u0127"+
		"\7\b\2\2\u0126\u0121\3\2\2\2\u0126\u0125\3\2\2\2\u0127+\3\2\2\2\u0128"+
		"\u0129\5P)\2\u0129\u012a\7\f\2\2\u012a\u012d\5\62\32\2\u012b\u012c\7\t"+
		"\2\2\u012c\u012e\5,\27\2\u012d\u012b\3\2\2\2\u012d\u012e\3\2\2\2\u012e"+
		"\u0131\3\2\2\2\u012f\u0131\3\2\2\2\u0130\u0128\3\2\2\2\u0130\u012f\3\2"+
		"\2\2\u0131-\3\2\2\2\u0132\u0133\5P)\2\u0133\u0134\7\f\2\2\u0134\u0137"+
		"\5\62\32\2\u0135\u0136\7\t\2\2\u0136\u0138\5.\30\2\u0137\u0135\3\2\2\2"+
		"\u0137\u0138\3\2\2\2\u0138\u013b\3\2\2\2\u0139\u013b\3\2\2\2\u013a\u0132"+
		"\3\2\2\2\u013a\u0139\3\2\2\2\u013b/\3\2\2\2\u013c\u013f\7\23\2\2\u013d"+
		"\u0140\5R*\2\u013e\u0140\5P)\2\u013f\u013d\3\2\2\2\u013f\u013e\3\2\2\2"+
		"\u013f\u0140\3\2\2\2\u0140\u0141\3\2\2\2\u0141\u0142\7\b\2\2\u0142\61"+
		"\3\2\2\2\u0143\u0144\b\32\1\2\u0144\u0145\7\n\2\2\u0145\u0146\5\62\32"+
		"\2\u0146\u0147\7\13\2\2\u0147\u0159\3\2\2\2\u0148\u0149\7\24\2\2\u0149"+
		"\u0159\5\62\32\20\u014a\u0159\5> \2\u014b\u0159\5<\37\2\u014c\u014e\7"+
		"\31\2\2\u014d\u014c\3\2\2\2\u014d\u014e\3\2\2\2\u014e\u014f\3\2\2\2\u014f"+
		"\u0159\5R*\2\u0150\u0152\7\31\2\2\u0151\u0150\3\2\2\2\u0151\u0152\3\2"+
		"\2\2\u0152\u0153\3\2\2\2\u0153\u0159\5T+\2\u0154\u0159\5V,\2\u0155\u0159"+
		"\5X-\2\u0156\u0159\5P)\2\u0157\u0159\5@!\2\u0158\u0143\3\2\2\2\u0158\u0148"+
		"\3\2\2\2\u0158\u014a\3\2\2\2\u0158\u014b\3\2\2\2\u0158\u014d\3\2\2\2\u0158"+
		"\u0151\3\2\2\2\u0158\u0154\3\2\2\2\u0158\u0155\3\2\2\2\u0158\u0156\3\2"+
		"\2\2\u0158\u0157\3\2\2\2\u0159\u016b\3\2\2\2\u015a\u015b\f\17\2\2\u015b"+
		"\u015c\t\2\2\2\u015c\u016a\5\62\32\20\u015d\u015e\f\16\2\2\u015e\u015f"+
		"\t\3\2\2\u015f\u016a\5\62\32\17\u0160\u0161\f\r\2\2\u0161\u0162\t\4\2"+
		"\2\u0162\u016a\5\62\32\16\u0163\u0164\f\f\2\2\u0164\u0165\7\36\2\2\u0165"+
		"\u016a\5\62\32\r\u0166\u0167\f\13\2\2\u0167\u0168\7\37\2\2\u0168\u016a"+
		"\5\62\32\f\u0169\u015a\3\2\2\2\u0169\u015d\3\2\2\2\u0169\u0160\3\2\2\2"+
		"\u0169\u0163\3\2\2\2\u0169\u0166\3\2\2\2\u016a\u016d\3\2\2\2\u016b\u0169"+
		"\3\2\2\2\u016b\u016c\3\2\2\2\u016c\63\3\2\2\2\u016d\u016b\3\2\2\2\u016e"+
		"\u016f\t\5\2\2\u016f\65\3\2\2\2\u0170\u0171\5P)\2\u0171\u0172\7\r\2\2"+
		"\u0172\u0173\5R*\2\u0173\u0174\7\16\2\2\u0174\67\3\2\2\2\u0175\u0176\7"+
		"$\2\2\u01769\3\2\2\2\u0177\u0178\7%\2\2\u0178\u0179\5P)\2\u0179;\3\2\2"+
		"\2\u017a\u017d\5P)\2\u017b\u017d\5> \2\u017c\u017a\3\2\2\2\u017c\u017b"+
		"\3\2\2\2\u017d\u017e\3\2\2\2\u017e\u0181\7&\2\2\u017f\u0182\5P)\2\u0180"+
		"\u0182\5> \2\u0181\u017f\3\2\2\2\u0181\u0180\3\2\2\2\u0182=\3\2\2\2\u0183"+
		"\u0184\5P)\2\u0184\u0185\7\r\2\2\u0185\u0186\5\62\32\2\u0186\u0187\7\16"+
		"\2\2\u0187?\3\2\2\2\u0188\u018f\5B\"\2\u0189\u018f\5D#\2\u018a\u018f\5"+
		"F$\2\u018b\u018f\5H%\2\u018c\u018f\5J&\2\u018d\u018f\5L\'\2\u018e\u0188"+
		"\3\2\2\2\u018e\u0189\3\2\2\2\u018e\u018a\3\2\2\2\u018e\u018b\3\2\2\2\u018e"+
		"\u018c\3\2\2\2\u018e\u018d\3\2\2\2\u018fA\3\2\2\2\u0190\u0191\7\'\2\2"+
		"\u0191\u0192\7\n\2\2\u0192\u0193\5P)\2\u0193\u0194\7\13\2\2\u0194C\3\2"+
		"\2\2\u0195\u0196\7(\2\2\u0196\u0197\7\n\2\2\u0197\u0198\5P)\2\u0198\u0199"+
		"\7\13\2\2\u0199E\3\2\2\2\u019a\u019b\7)\2\2\u019b\u019e\7\n\2\2\u019c"+
		"\u019f\5X-\2\u019d\u019f\5P)\2\u019e\u019c\3\2\2\2\u019e\u019d\3\2\2\2"+
		"\u019f\u01a4\3\2\2\2\u01a0\u01a1\7\t\2\2\u01a1\u01a3\5\62\32\2\u01a2\u01a0"+
		"\3\2\2\2\u01a3\u01a6\3\2\2\2\u01a4\u01a2\3\2\2\2\u01a4\u01a5\3\2\2\2\u01a5"+
		"\u01a7\3\2\2\2\u01a6\u01a4\3\2\2\2\u01a7\u01a8\7\13\2\2\u01a8G\3\2\2\2"+
		"\u01a9\u01aa\7*\2\2\u01aa\u01ab\7\n\2\2\u01ab\u01b7\5X-\2\u01ac\u01ae"+
		"\7\t\2\2\u01ad\u01af\7+\2\2\u01ae\u01ad\3\2\2\2\u01ae\u01af\3\2\2\2\u01af"+
		"\u01b3\3\2\2\2\u01b0\u01b4\5P)\2\u01b1\u01b4\5> \2\u01b2\u01b4\5<\37\2"+
		"\u01b3\u01b0\3\2\2\2\u01b3\u01b1\3\2\2\2\u01b3\u01b2\3\2\2\2\u01b4\u01b6"+
		"\3\2\2\2\u01b5\u01ac\3\2\2\2\u01b6\u01b9\3\2\2\2\u01b7\u01b5\3\2\2\2\u01b7"+
		"\u01b8\3\2\2\2\u01b8\u01ba\3\2\2\2\u01b9\u01b7\3\2\2\2\u01ba\u01bb\7\13"+
		"\2\2\u01bbI\3\2\2\2\u01bc\u01bd\7,\2\2\u01bd\u01be\7\n\2\2\u01be\u01bf"+
		"\5P)\2\u01bf\u01c0\7\13\2\2\u01c0K\3\2\2\2\u01c1\u01c2\5P)\2\u01c2\u01d1"+
		"\7\n\2\2\u01c3\u01c6\5N(\2\u01c4\u01c6\5P)\2\u01c5\u01c3\3\2\2\2\u01c5"+
		"\u01c4\3\2\2\2\u01c6\u01ce\3\2\2\2\u01c7\u01ca\7\t\2\2\u01c8\u01cb\5N"+
		"(\2\u01c9\u01cb\5P)\2\u01ca\u01c8\3\2\2\2\u01ca\u01c9\3\2\2\2\u01cb\u01cd"+
		"\3\2\2\2\u01cc\u01c7\3\2\2\2\u01cd\u01d0\3\2\2\2\u01ce\u01cc\3\2\2\2\u01ce"+
		"\u01cf\3\2\2\2\u01cf\u01d2\3\2\2\2\u01d0\u01ce\3\2\2\2\u01d1\u01c5\3\2"+
		"\2\2\u01d1\u01d2\3\2\2\2\u01d2\u01d3\3\2\2\2\u01d3\u01d4\7\13\2\2\u01d4"+
		"M\3\2\2\2\u01d5\u01da\5R*\2\u01d6\u01da\5T+\2\u01d7\u01da\5V,\2\u01d8"+
		"\u01da\5X-\2\u01d9\u01d5\3\2\2\2\u01d9\u01d6\3\2\2\2\u01d9\u01d7\3\2\2"+
		"\2\u01d9\u01d8\3\2\2\2\u01daO\3\2\2\2\u01db\u01dc\7-\2\2\u01dcQ\3\2\2"+
		"\2\u01dd\u01de\7.\2\2\u01deS\3\2\2\2\u01df\u01e0\7/\2\2\u01e0U\3\2\2\2"+
		"\u01e1\u01e2\7\60\2\2\u01e2W\3\2\2\2\u01e3\u01e4\7\61\2\2\u01e4Y\3\2\2"+
		"\2\u01e5\u01e6\7\62\2\2\u01e6[\3\2\2\2\60_giv}\u0081\u0086\u008a\u0092"+
		"\u00a1\u00a5\u00b1\u00b3\u00be\u00c4\u00ca\u00ce\u00dd\u00e4\u00ea\u00f3"+
		"\u00f7\u0126\u012d\u0130\u0137\u013a\u013f\u014d\u0151\u0158\u0169\u016b"+
		"\u017c\u0181\u018e\u019e\u01a4\u01ae\u01b3\u01b7\u01c5\u01ca\u01ce\u01d1"+
		"\u01d9";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}