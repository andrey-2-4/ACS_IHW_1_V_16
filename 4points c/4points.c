#include "stdio.h"

int main() {
	int A[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	int B[10];
	int a = 0;
	for (int i = 0; i < 10; ++i) {
		a += A[i];
	}
	a /= 10;
	for (int i = 0; i < 10; ++i) {
		if (A[i] > a) {
			B[i] = a;
		} else {
			B[i] = A[i];
		}
	}
	return 0;
}
