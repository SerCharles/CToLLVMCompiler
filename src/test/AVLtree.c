#include <stdio.h>

struct AVLNode{
	int elem;
	int is_null;
	int height;
	int left, right;
};

int root;

struct AVLNode nodes[10000];
int avai;

int max(int a, int b){
	if(a > b) {
		return a;
	}
	return b;
}

void initTree(){
	int i;
	avai = 1;
	root = 0;
	for(i = 0; i < 10000; i=i+1){
		nodes[i].is_null = 1;
		nodes[i].height = 0;
		nodes[i].left = 0;
		nodes[i].right = 0;
	}
	return;
}

int getHeight(int node){
	int ret;
	if (nodes[node].is_null == 0) {
		ret = nodes[node].height;
		return ret;
	}
	ret = -1;
	return ret;
}

int leftLeftRotation(int node){
	int temp = nodes[node].left, p1, p2;
	nodes[node].left = nodes[nodes[node].left].right;
	nodes[temp].right = node;

	int param;
	param = nodes[node].left;
	p1 = getHeight(param);
	param = nodes[node].right;
	p2 = getHeight(param);
	nodes[node].height = max(p1, p2) + 1;
	param = nodes[temp].left;
	p1 = getHeight(param);
	param = nodes[temp].right;
	p2 = getHeight(param);
	nodes[temp].height = max(p1, p2) + 1;
	return temp;
}

int rightRightRotation(int node){
	int temp = nodes[node].right, p1, p2;
	nodes[node].right = nodes[nodes[node].right].left;
	nodes[temp].left = node;

	int param;
	param = nodes[node].left;
	p1 = getHeight(param);
	param = nodes[node].right;
	p2 = getHeight(param);
	nodes[node].height = max(p1, p2) + 1;
	param = nodes[temp].left;
	p1 = getHeight(param);
	param = nodes[temp].right;
	p2 = getHeight(param);
	nodes[temp].height = max(p1, p2) + 1;
	return temp;
}

int leftRightRotation(int node){
	int ret;
	int param = nodes[node].left;
	nodes[node].left = rightRightRotation(param);
	ret = leftLeftRotation(node);
	return ret;
}

int rightLeftRotation(int node){
	int ret;
	int param = nodes[node].right;
	nodes[node].right = leftLeftRotation(param);
	ret = rightRightRotation(node);
	return ret;
}

int insert(int node, int elem){
	int param, p1, p2;
	if(nodes[node].is_null != 0){
		int i = avai;
		while(nodes[i].is_null == 0) {i = i + 1;}
		nodes[i].is_null = 0;
		nodes[i].elem = elem;
		avai = i + 1;
		return i;
	}else if(elem < nodes[node].elem){
		param = nodes[node].left;
		nodes[node].left = insert(param, elem);
		p1 = nodes[nodes[node].left].height;
		p2 = nodes[nodes[node].right].height;
		nodes[node].height = max(p1, p2) + 1;
		p1 = nodes[node].left;
		p2 = nodes[node].right;
		if (getHeight(p1) - getHeight(p2) == 2){
			if (elem < nodes[nodes[node].left].elem) {
				node = leftLeftRotation(node);
			}
			else {
				node = leftRightRotation(node);
			}
		}
		return node;
	}else if(elem > nodes[node].elem){
		param = nodes[node].right;
		nodes[node].right = insert(param, elem);
		p1 = nodes[nodes[node].left].height;
		p2 = nodes[nodes[node].right].height;
		nodes[node].height = max(p1, p2) + 1;
		p1 = nodes[node].left;
		p2 = nodes[node].right;
		if (getHeight(p1) - getHeight(p2) == -2){
			if (elem > nodes[nodes[node].right].elem) {
				node = rightRightRotation(node);
			}
			else {
				node = rightLeftRotation(node);
			}
		}
		return node;
	}
	return 0;
}

void addNode(int elem){
	root = insert(root, elem);
	return;
}

int search(int node, int elem){
	int ret, p;
	if(nodes[node].is_null != 0) {
		return 0;
	}
	if(elem == nodes[node].elem) {
		return node;
	}
	else if(elem < nodes[node].elem) {
		p = nodes[node].left;
		ret = search(p, elem);
		return ret;
	}
	else {
		p = nodes[node].right;
		ret = search(p, elem);
		return ret;
	}
	return 0;
}

int searchNode(int elem){
	int ret;
	ret = search(root, elem);
	return ret;
}



void removeNode(int elem){
	return;
}

void printNode(int node){
	if(nodes[node].is_null != 0){
		printf("NULL\n");
		return;
	}
	printf("%d left child is ", nodes[node].elem);
	if(nodes[nodes[node].left].is_null != 0) {
		printf("NULL, right child is ");
	}
	else {
		printf("%d, right child is ", nodes[nodes[node].left].elem);
	}

	if(nodes[nodes[node].right].is_null != 0) {
		printf("NULL\n");
	}
	else{
		printf("%d\n", nodes[nodes[node].right].elem);
	}
	return;
}

void printAVL(int node){
	if(nodes[node].is_null != 0) {
		return;
	}
	printNode(node);
	int p;
	p = nodes[node].left;
    printAVL(p);
    p = nodes[node].right;
    printAVL(p);
    return;
}

int main(){
	int n, i, elem, comm, p;
	initTree();

	while(1){
		scanf("%d%d", &comm, &elem);
		if(comm == 0){
			addNode(elem);
			printAVL(root);
		}
		else if(comm == 1){
			removeNode(elem);
			printAVL(root);
		}
		else if(comm == 2) {
			p = searchNode(elem);
			printNode(p);
		}
		
	}
	return 0;
}
