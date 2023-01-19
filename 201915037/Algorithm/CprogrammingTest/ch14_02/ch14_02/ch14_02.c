#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

char* get_fruit_arr(char* fruit) {
	//아래를 완성하시오.
	return fruit;
}
char get_char_arr(char* fruit, int idx) {
	//아래를 완성하시오.

	return fruit[idx];
}

char* get_fruit_ptr(char* fruits[]) {
	//아래를 완성하시오.

	return *(fruits - 1);
}
char get_char_ptr(char* fruit[], int idx) {
	//아래를 완성하시오.

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
	//1-4번
	char* fruits[] = { "Apple", "Tomato", "Pineapple" };
	int fruits_num, char_num, size = 3;
	for (int i = 0; i < size; i++)
		printf("%d. %s\n", i + 1, fruits[i]);
	printf("과일번호 : ");
	scanf("%d", &fruits_num);
	printf("문자 인덱스: ");
	scanf("%d", &char_num);

	//printf("과일: %s, 문자:%c\n", fruits[fruits_num-1], fruits[fruits_num-1][char_num]);

	printf("과일: %s, ", get_fruit_arr(fruits[fruits_num - 1]));
	printf("문자: %c\n", get_char_arr(fruits[fruits_num - 1], char_num));
	printf("과일: %s, ", get_fruit_ptr(fruits + fruits_num));
	printf("문자: %c\n", get_char_ptr(fruits + fruits_num - 1, char_num));

	//5번
	int n;
	printf("1. 오름차순\n2. 내림차순\n번호를 입력하시오:");
	scanf("%d", &n);

	//아래를 완성하시오.
	//함수 포인터 pf를 선언후 적절한 함수를 배정하시오.
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


/*예시 출력결과
1. Apple
2. Tomato
3. Pineapple
과일번호 : 2
문자 인덱스: 2
과일: Tomato, 문자: m
과일: Tomato, 문자: m
1. 오름차순
2. 내림차순
번호를 입력하시오:2
1. Pineapple
2. Tomato
3. Apple
계속하려면 아무 키나 누르십시오 . . .
*/
/*실제 출력결과
1. Apple
2. Tomato
3. Pineapple
과일번호 : 2
문자 인덱스: 2
과일: Tomato, 문자: m
과일: Tomato, 문자: m
1. 오름차순
2. 내림차순
번호를 입력하시오:2
1. Pineapple
2. Tomato
3. Apple
*/
