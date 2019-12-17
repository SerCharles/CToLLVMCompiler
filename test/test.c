int a, b;
int d[10];

struct mstruct{
    int a;
    double b[10];
};

// struct mstruct x;
struct mstruct x[10];

void void_foo(){
    printf("void_foo\n");
    return;
}

int foo(int a, int b) {
    if (a > b) {
        return a;
    }
    return b;
}

int main() {
    int i;
    i = 0;
    if (!i){
        printf("i == 0\n");
    } else
    {
        printf("i != 0\n");
    }
    return 0;
}