#include  <string.h>
#include <stdlib.h>

int main() {
	char S[1024];
	char T[1024];
	int nxt[1024];
	int lenS, lenT;
	int i, j, flag = 0;

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
            j = j + 1;
        }
		if (j == lenT-1) {
			printf("%d\n", i - j);
			flag = 1;
			j = nxt[j];
		}
	}
	if (flag == 0){
		printf("False\n");
    }

	return 0;
}
