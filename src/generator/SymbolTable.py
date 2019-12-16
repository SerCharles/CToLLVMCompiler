

import unittest

class RedefinitionError(Exception):
    """重定义错误"""
    def __init__(self, name):
        """
        :param name: 重定义的变量名
        """
        self.name = name


class SymbolTable:
    '''
    符号表类
    '''
    def __init__(self):
        '''
        功能：建立符号表
        参数：无
        返回：无
        '''
        #table：table[i]是一个字典，存着key，value组
        self.Table = [{}]
        self.CurrentLevel = 0  

    def GetItem(self, item):
        '''
        功能：从符号表中获取元素
        参数：待获取的元素的key
        返回：无
        '''
        i = self.CurrentLevel
        while i >= 0:
            TheItemList = self.Table[i]
            if item in TheItemList:
                return TheItemList[item]
            i -= 1
        return None

    def AddItem(self, key, value):
        '''
        功能：向符号表中添加元素
        参数：待添加的key，value
        返回：如果同一层有一样的，返回错误
        '''
        if key in self.Table[self.CurrentLevel]:
            raise RedefinitionError(key)
        self.Table[self.CurrentLevel][key] = value

    def JudgeExist(self, item):
        '''
        功能：判断元素是否在符号表里
        参数：待判断的元素
        返回：如果表里有，true，否则false
        '''
        i = self.CurrentLevel
        while i >= 0:
            if item in self.Table[i]:
                return True
            i -= 1
        return False

    def EnterScope(self):
        '''
        功能：进入一个新的作用域，增加一层
        参数：无
        返回：无
        '''
        self.CurrentLevel += 1
        self.Table.append({})

    def QuitScope(self):
        '''
        功能：退出一个作用域，退出一层
        参数：无
        返回：无
        '''
        if self.CurrentLevel == 0:
            return
        self.Table.pop(-1)
        self.CurrentLevel -= 1


class SymbolTableTest(unittest.TestCase):
    """符号表单元测试"""
    def setUp(self):
        self.symbol_table = SymbolTable()

    def tearDown(self):
        pass

    def test_1(self):
        """内层变量覆盖外层同名变量"""
        self.symbol_table.AddItem("abc", 123)
        self.symbol_table.EnterScope()
        self.assertEqual(self.symbol_table.GetItem("abc"),123)
        self.symbol_table.AddItem("abc", 333)
        self.assertEqual(self.symbol_table.GetItem("abc"), 333)
        self.symbol_table.QuitScope()
        self.assertEqual(self.symbol_table.GetItem("abc"), 123)

    def test_2(self):
        """离开当前作用域后需要删除临时变量"""
        self.symbol_table.EnterScope()
        self.symbol_table.AddItem("abc", 333)
        self.assertEqual(self.symbol_table.GetItem("abc"), 333)
        self.symbol_table.QuitScope()
        self.assertIsNone(self.symbol_table.GetItem("abc"))


if __name__ == '__main__':
    unittest.main()