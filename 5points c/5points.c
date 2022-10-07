#include "stdio.h"
#include "stdlib.h"

int main(int argc, char* argv[]) {
	int n = argc - 1;
	int A[100];
	int B[100];
	int a = 0;
	for (int i = 0; i < n; ++i) {
		A[i] = atoi(argv[i + 1]);
		a += A[i];
		printf("%d", A[i]);
		printf(" ");
	}
	printf("\n");
	a /= n;
	for (int i = 0; i < n; ++i) {
		if (A[i] > a) {
			B[i] = a;
		} else {
			B[i] = A[i];
		}
		printf("%d", B[i]);
		printf(" ");
	}
	printf("\n");
	return 0;
}
