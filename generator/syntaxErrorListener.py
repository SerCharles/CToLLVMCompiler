from antlr4.error.ErrorListener import ErrorListener
from antlr4 import *

class syntaxErrorListener(ErrorListener):
    
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        exception = str(line) + ":" + str(column) + " " + msg
        print('Syntax Error: ' + exception)
        #self.underlineError(recognizer, offendingSymbol, line, column)

   
    def underlineError(self, recognizer, offendingSymbol, line, column):
        tokens = recognizer.getInputStream()
        input = str(tokens)
        lines = input.split('\n')
        print(lines)
        errorLine = lines[line - 1]
        print(errorLine)
        for item in range(column):
            print(' ', end='')
        start = offendingSymbol.getStartIndex()
        stop = offendingSymbol.getStopIndex()
        if start >= 0 and stop >= 0:
            for item in range(stop-start):
                print("^",end='')
        print('\n')
