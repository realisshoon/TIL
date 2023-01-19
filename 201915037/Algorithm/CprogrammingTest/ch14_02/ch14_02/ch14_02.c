#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

char* get_fruit_arr(char* fruit) {
	//�Ʒ��� �ϼ��Ͻÿ�.
	return fruit;
}
char get_char_arr(char* fruit, int idx) {
	//�Ʒ��� �ϼ��Ͻÿ�.

	return fruit[idx];
}

char* get_fruit_ptr(char* fruits[]) {
	//�Ʒ��� �ϼ��Ͻÿ�.

	return *(fruits - 1);
}
char get_char_ptr(char* fruit[], int idx) {
	//�Ʒ��� �ϼ��Ͻÿ�.

	return *(*(fruit)+idx);
}

void ascend(char* list[], int size) {
	int i, j, select;
	char* tmp;

	for (i = 0; i < size - 1; i++) {
		select = i;
		for (j = i + 1; j < size; j++) {
			if (strcmp(list[j], list[select]) < 0)
				select = j;
			tmp = list[i];
			list[i] = list[select];
			list[select] = tmp;
		}
	}
}
void descend(char* list[], int size) {
	int i, j, select;
	char* tmp;

	for (i = 0; i < size - 1; i++) {
		select = i;
		for (j = i + 1; j < size; j++) {
			if (strcmp(list[j], list[select]) > 0)
				select = j;
			tmp = list[i];
			list[i] = list[select];
			list[select] = tmp;
		}
	}
}
int main(void)
{
	//1-4��
	char* fruits[] = { "Apple", "Tomato", "Pineapple" };
	int fruits_num, char_num, size = 3;
	for (int i = 0; i < size; i++)
		printf("%d. %s\n", i + 1, fruits[i]);
	printf("���Ϲ�ȣ : ");
	scanf("%d", &fruits_num);
	printf("���� �ε���: ");
	scanf("%d", &char_num);

	//printf("����: %s, ����:%c\n", fruits[fruits_num-1], fruits[fruits_num-1][char_num]);

	printf("����: %s, ", get_fruit_arr(fruits[fruits_num - 1]));
	printf("����: %c\n", get_char_arr(fruits[fruits_num - 1], char_num));
	printf("����: %s, ", get_fruit_ptr(fruits + fruits_num));
	printf("����: %c\n", get_char_ptr(fruits + fruits_num - 1, char_num));

	//5��
	int n;
	printf("1. ��������\n2. ��������\n��ȣ�� �Է��Ͻÿ�:");
	scanf("%d", &n);

	//�Ʒ��� �ϼ��Ͻÿ�.
	//�Լ� ������ pf�� ������ ������ �Լ��� �����Ͻÿ�.
	char (*pf) (char, int);
	if (n =1) {
		pf = ascend;
	}
	if (n = 2) {
		pf = descend;
	}

	pf(fruits, sizeof(fruits) / sizeof(char*));

	for (int i = 0; i < size; i++)
		printf("%d. %s\n", i + 1, fruits[i]);

	return 0;
}


/*���� ��°��
1. Apple
2. Tomato
3. Pineapple
���Ϲ�ȣ : 2
���� �ε���: 2
����: Tomato, ����: m
����: Tomato, ����: m
1. ��������
2. ��������
��ȣ�� �Է��Ͻÿ�:2
1. Pineapple
2. Tomato
3. Apple
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
/*���� ��°��
1. Apple
2. Tomato
3. Pineapple
���Ϲ�ȣ : 2
���� �ε���: 2
����: Tomato, ����: m
����: Tomato, ����: m
1. ��������
2. ��������
��ȣ�� �Է��Ͻÿ�:2
1. Pineapple
2. Tomato
3. Apple
*/
