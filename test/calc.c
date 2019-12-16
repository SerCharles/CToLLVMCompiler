#include <stdio.h>
#include <string.h>

int main(){
    char expr[1000];
    int st_num[1000];
    char st_op[1000];

    int st_num_pt = -1;
    int st_op_pt = -1;

    gets(expr);
    int len = strlen(expr);
    int i;
    for(i = len-1; i >= 0; i = i - 1) {
        expr[i + 1] = expr[i];
    }
    expr[0] = '(';
    expr[len+1] = ')';
    len = len + 2;

    i = len - 1;
    int num = 0;
    int k = 1;
    while(i >= 0){
        if(expr[i] == '+'){
            while(st_op_pt >= 0 && ((st_op[st_op_pt] == '*') || (st_op[st_op_pt] == '/'))){
                if(st_op[st_op_pt] == '*') {
                    st_num[st_num_pt - 1] = st_num[st_num_pt] * st_num[st_num_pt - 1];
                }
                else {
                    st_num[st_num_pt - 1] = st_num[st_num_pt] / st_num[st_num_pt - 1];
                }
                st_num_pt = st_num_pt - 1;
                st_op_pt = st_op_pt - 1;
            }
            st_op_pt = st_op_pt + 1;
            st_op[st_op_pt] = '+';
            i = i - 1;
        }else if(expr[i] == '-'){
            while(st_op_pt >= 0 && ((st_op[st_op_pt] == '*') || (st_op[st_op_pt] == '/'))){
                if(st_op[st_op_pt] == '*'){
                    st_num[st_num_pt - 1] = st_num[st_num_pt] * st_num[st_num_pt - 1];
                }
                else{
                    st_num[st_num_pt - 1] = st_num[st_num_pt] / st_num[st_num_pt - 1];
                }
                st_num_pt = st_num_pt - 1;
                st_op_pt = st_op_pt - 1;
            }
            st_op_pt = st_op_pt + 1;
            st_op[st_op_pt] = '-';
            i = i - 1;
        }else if(expr[i] == '*'){
            st_op_pt = st_op_pt + 1;
            st_op[st_op_pt] = '*';
            i = i - 1;
        }else if(expr[i] == '/'){
            st_op_pt = st_op_pt + 1;
            st_op[st_op_pt] = '/';
            i = i - 1;
        }else if(expr[i] == ')'){
            st_op_pt = st_op_pt + 1;
            st_op[st_op_pt] = ')';
            i = i - 1;
        }else if(expr[i] == '('){
            while(st_op[st_op_pt] != ')'){
                char ch = st_op[st_op_pt];
                st_op_pt = st_op_pt - 1;
                if(ch == '+'){
                    st_num[st_num_pt - 1] = st_num[st_num_pt] + st_num[st_num_pt - 1];
                }
                else if(ch == '-'){
                    st_num[st_num_pt - 1] = st_num[st_num_pt] - st_num[st_num_pt - 1];
                }
                else if(ch == '*'){
                    st_num[st_num_pt - 1] = st_num[st_num_pt] * st_num[st_num_pt - 1];
                }
                else if(ch == '/'){
                    st_num[st_num_pt - 1] = st_num[st_num_pt] / st_num[st_num_pt - 1];
                }
                st_num_pt = st_num_pt - 1;
            }
            st_op_pt = st_op_pt - 1;
            i = i - 1;
        }else{
            num = 0;
            k = 1;
            while(i >= 0 && expr[i] >= '0' && expr[i] <= '9'){
                num = num + (expr[i] - '0') * k;
                k = k * 10;
                i = i - 1;
            }
            st_num_pt = st_num_pt + 1;
            st_num[st_num_pt] = num;
        }
    }
    printf("%d\n", st_num[0]);
    return 0;
}
