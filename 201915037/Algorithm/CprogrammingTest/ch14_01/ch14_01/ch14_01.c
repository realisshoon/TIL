#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

void maxMin_idx(int* arr, int size, int* max_idx, int* min_idx) {
	*max_idx = *min_idx = 0;
	for (int i = 1; i < size; i++) {
		//�Ʒ��� �ϼ��Ͻÿ�.
		if (arr[i - 1] > *max_idx) {
			*max_idx = i - 1;
		}
		*min_idx = arr[0];
		if (arr[i - 1] < *min_idx) {
			*min_idx = i - 1;
		}
	}
}
void maxMin_ptr(int* arr, int size, int** max_ptr, int** min_ptr) {
	*max_ptr = *min_ptr = arr;
	for (int i = 1; i < size; i++) {
		//�Ʒ��� �ϼ��Ͻÿ�.
		if (**max_ptr < arr[i]) {
			*max_ptr = &arr[i];
		}
		if (**min_ptr > arr[i]) {
			*min_ptr = &arr[i];
		}
	}
	
	
}
void get_max_1(int(*ptr)[4], int size, int* max_idx) {
	*max_idx = 0;
	for (int i = 1; i < size; i++) {
		//�Ʒ��� �ϼ��Ͻÿ�.
		if (*max_idx < *ptr[i]) {
			*max_idx = i-1 ;
		}

	}
}

void get_max_2(int* ptr, int size, int** max_ptr) {
	*max_ptr = ptr;
	for (int i = 1; i < size; i++) {
		//�Ʒ��� �ϼ��Ͻÿ�.
		if (**max_ptr < ptr[i]) {
			*max_ptr = &ptr[i];
		}

	}
}

int main(void)
{
	//1��
	int max_idx, min_idx;
	int* max_ptr, * min_ptr;
	int arr[5] = { 5, 3, 8, 1, 2 };

	maxMin_idx(arr, sizeof(arr) / sizeof(int), &max_idx, &min_idx);
	printf("�ִ� �ε���: %d, �ּ� �ε���: %d\n", max_idx, min_idx);

	//2��
	maxMin_ptr(arr, sizeof(arr) / sizeof(int), &max_ptr, &min_ptr);
	printf("�ִ� ���: %d, �ּ� ���: %d\n", *max_ptr, *min_ptr);

	int arr_2d[][4] = { {3, 5, 1, 7}, {2, 4, 3, 0}, {8, 3, 5, 2}, {6, 2, 3, 4} };
	int row = 1;
	//3��
	get_max_1(arr_2d + row, sizeof(arr_2d[row]) / sizeof(int), &max_idx);
	printf("2���� �迭 %d�� �ִ� �ε���: %d\n", row, max_idx);

	//4��
	get_max_2(arr_2d[row], sizeof(arr_2d[row]) / sizeof(int), &max_ptr);
	printf("2���� �迭 %d�� �ִ� ���: %d\n", row, *max_ptr);

	return 0;
}


/*���� ��°��
�ִ� �ε���: 2, �ּ� �ε���: 3
�ִ� ���: 8, �ּ� ���: 1
2���� �迭 1�� �ִ� �ε���: 1
2���� �迭 1�� �ִ� ���: 4
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
/*���� ��°��
�ִ� �ε���: 2, �ּ� �ε���: 3
�ִ� ���: 8, �ּ� ���: 1
2���� �迭 1�� �ִ� �ε���: 1
2���� �迭 1�� �ִ� ���: 4
*/