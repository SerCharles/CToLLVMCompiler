int a = 887;
char b = 'c';

int fun1(int a, int b)
{
    return 1;
}

int fun1(int a, int b)
{
    return 2;
}

int main()
{
    printf("a = %d\n", a);
    printf("b = %c\n", b);
    return 0;
}