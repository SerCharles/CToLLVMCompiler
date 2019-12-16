
#include  <string.h>
#include <stdlib.h>
int a = 1;
char b = '1';


int main() {
	c=2;
	char S[1024];
	char T[1024];
	int nxt[1024];
	int lenS, lenT;
	int i, j, flag = 0;
	//struct test myTest[2];
	//myTest[0].a=myTest[1].b[1];
	
	gets(S);
	gets(T);
	lenS = strlen(S);
	lenT = strlen(T);
	nxt[0] = -1;
	for (i = 1, j = -1; i < lenT;  i = i + 1) {
		for (; j >= 0 && T[i] != T[j+1]; j = nxt[j]);
		if (T[i] == T[j+1]) {
            j = j+1;
        }
		nxt[i] = j;
	}
	for (i = 0, j = -1; i < lenS; i = i + 1) {
		for (; j >= 0 && S[i] != T[j+1]; j = nxt[j]);
		if (S[i] == T[j+1]) {
            j = j+1;
            }
		if (j == lenT-1) {
			printf("%d\n", i-j);
			flag = 1;
			j = nxt[j];
		}
	}
	if (flag == 0){
		printf("False\n");
    }

	return 0;
}


int main2() {
	char s[1024];
	int len, i;
	gets(s);
	len = strlen(s);
	if (len < 0 || len > 1024) {
		printf("Error detected!\n");
	}
	else{
        for (i = 0; i + i < len; i = i + 1){
            if (s[i] != s[len - 1 - i]) {
                printf("False\n");
                return 0;
            }
        }
        printf("True\n");
    }
	return 0;
}
