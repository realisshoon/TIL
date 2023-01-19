
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

typedef struct point {
	int x, y;
} Point;
typedef struct rectangle {
	Point p1, p2;
} Rectangle;

struct date {          // date 구조체의 선언
	int year;
	int month;
	int day;
};

struct student {       // student 구조체 선언
	int sno;
	char name[10];
	struct date* sd;   // 포인터를 사용하여 구조체 멤버 선언
};

int rect_area(Rectangle rect)
{
	//아래를 완성하시오.
	int area = 0;
	int wid, len = 0;
	wid = rect.p2.x - rect.p1.x;
	len = rect.p2.y - rect.p1.y;
	area = wid * len;
	return area;
}
void rect_points(Rectangle* rp, Point arr[])
{
	arr[0] = rp->p1;
	//아래를 완성하시오.
	arr[1].x = rp->p2.x, arr[1].y = rp->p1.y;
	arr[2] = rp->p2;
	arr[3].x = rp->p1.x, arr[3].y = rp->p2.y;
}
int main(void)
{
	//1번
	Point point_arr[4];
	Rectangle rect = { {10, 20}, {110, 70} };

	int area = rect_area(rect);
	rect_points(&rect, point_arr);
	printf("사각형: 넓이: %d, 4개의 점:", area);
	for (int i = 0; i < 4; i++)
		printf("(%d,%d) ", point_arr[i].x, point_arr[i].y);
	printf("\n");

	//2번
	struct date d = { 2002, 05, 05 };

	// 구조체 변수(변수명: student) 선언과 초기화
	//아래를 완성하시오.
	struct student s = { 20251234,"홍길동"};
	s.sd = &d;

	printf("포인터를 구조체 멤버로 선언하는 프로그램 \n");
	//아래를 완성하시오.(출력)
	printf("학번 : %d", s.sno);
	printf("\n");
	printf("성명 : %s", s.name);
	printf("\n");
	printf("생년월일 : %d. %02d. %02d.", s.sd->year, s.sd->month, s.sd->day);


	return 0;
}



/*예시 출력결과
사각형: 넓이: 5000, 4개의 점:(10,20) (110,20) (110,70) (10,70)
포인터를 구조체 멤버로 선언하는 프로그램
 학번 : 20251234
 성명 : 홍길동
 생년월일 : 2002. 05. 05.
계속하려면 아무 키나 누르십시오 . . .
*/
/*실제 출력결과
사각형: 넓이: 5000, 4개의 점:(10,20) (110,20) (110,70) (10,70)
포인터를 구조체 멤버로 선언하는 프로그램
학번 : 20251234
성명 : 홍길동
생년월일 : 2002. 05. 05.
*/