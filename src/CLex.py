import ply.lex as lex

tokens = (
    #关键字
    'INT','DOUBLE','FLOAT','BOOL','CHAR','VOID',
    'WHILE','FOR','DO','IF','ELSE','RETURN','CONTINUE','BREAK',

    #变量，数字，常量字符串
    'IDENTIFIER', 'NUMBER', 'STRING',

    #多位运算符
    'SADD', 'SMINUS',
    'GE', 'LE', 'EQ', 'NE',
    'NOT', 'AND', 'OR',
    'LSH', 'RSH',
    'AD_ASSIGN', 'MN_ASSIGN', 'MT_ASSIGN', 'DV_ASSIGN', 'MD_ASSIGN',
    'LSH_ASSIGN', 'RSH_ASSIGN', 'BAND_ASSIGN', 'BOR_ASSIGN', 'BXOR_ASSIGN',
    
    #指针
    'ARROW',
)

RESERVED = {
    #类型
    'int':'INT',
    'double':'DOUBLE',
    'float':'FLOAT',
    'bool':'BOOL',
    'char':'CHAR',
    'void':'VOID',
    #过程
    'while':'WHILE',
    'for':'FOR',
    'do':'DO',
    'if':'IF',
    'else':'ELSE',
    'return':'RETURN',
    'continue':'CONTINUE',
    'break':'BREAK'
}

def t_IDENTIFIER(t):
    r'[a-zA-Z_][a-zA-Z0-9_]*'
    t.type = RESERVED.get(t.value, 'IDENTIFIER')
    return t

    
def t_NUMBER(t):
    r'[\d]+'
    t.value = int(t.value)
    return t

t_STRING = r'"[^"]*"'

t_SADD = r'\+\+'
t_SMINUS = r'--'
t_GE = r'>='
t_LE = r'<='
t_EQ = r'=='
t_NE = r'!='
t_LSH = r'<<'
t_RSH = r'>>'
t_AND = r'&&'
t_OR = r'\|\|'
t_AD_ASSIGN = r'\+='
t_MN_ASSIGN = r'-='
t_MT_ASSIGN = r'\*='
t_DV_ASSIGN = r'/='
t_MD_ASSIGN = r'%='
t_LSH_ASSIGN = r'<<='
t_RSH_ASSIGN = r'>>='
t_BAND_ASSIGN = r'&='
t_BOR_ASSIGN = r'\|='
t_BXOR_ASSIGN = r'\^='
t_ARROW = r'->'

literals = ['+','-','*','/','%',
'[',']','{','}','(',')',':','\'','\"',
'>','<','=','&','|','^','!','~',
'#',';',',','.']

def t_COMMENT(t):
    r'//[^\n]*\n|/\*[^/\*]*\*/'
    pass

# Define a rule so we can track line numbers
def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)

# A string containing ignored characters (spaces and tabs)
t_ignore  = ' \t'

# Error handling rule
def t_error(t):
    print("Illegal character '%s' at line %d " % (t.value[0], t.lineno))
    t.lexer.skip(1)

lexer = lex.lex()


# Test it out
data = '''
extern int printf(char* c);
extern int scanf(char* c);
extern int strlen(char* s);

int main()
{
	char s[10086];
	scanf("%s", s);
	int len; 
	int mid;
	len = strlen(&s[0]);
	for(mid = len >> 1; mid >= 0; mid = mid - 1) 
	{
		if(s[mid] != s[len - 1 - mid])
		{
			printf("not palindrome!");
			return 0;
            //kebab
            /*remove
            kebab*/
		}
	}
	printf("palindrome!");
	return 0;
}
'''

# Give the lexer some input
lexer.input(data)

# Tokenize
while True:
    tok = lexer.token()
    if not tok: 
        break      # No more input
    print (tok)
