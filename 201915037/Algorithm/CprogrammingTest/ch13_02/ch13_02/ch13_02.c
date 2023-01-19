
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

struct date {          // date ����ü�� ����
	int year;
	int month;
	int day;
};

struct student {       // student ����ü ����
	int sno;
	char name[10];
	struct date* sd;   // �����͸� ����Ͽ� ����ü ��� ����
};

int rect_area(Rectangle rect)
{
	//�Ʒ��� �ϼ��Ͻÿ�.
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
	//�Ʒ��� �ϼ��Ͻÿ�.
	arr[1].x = rp->p2.x, arr[1].y = rp->p1.y;
	arr[2] = rp->p2;
	arr[3].x = rp->p1.x, arr[3].y = rp->p2.y;
}
int main(void)
{
	//1��
	Point point_arr[4];
	Rectangle rect = { {10, 20}, {110, 70} };

	int area = rect_area(rect);
	rect_points(&rect, point_arr);
	printf("�簢��: ����: %d, 4���� ��:", area);
	for (int i = 0; i < 4; i++)
		printf("(%d,%d) ", point_arr[i].x, point_arr[i].y);
	printf("\n");

	//2��
	struct date d = { 2002, 05, 05 };

	// ����ü ����(������: student) ����� �ʱ�ȭ
	//�Ʒ��� �ϼ��Ͻÿ�.
	struct student s = { 20251234,"ȫ�浿"};
	s.sd = &d;

	printf("�����͸� ����ü ����� �����ϴ� ���α׷� \n");
	//�Ʒ��� �ϼ��Ͻÿ�.(���)
	printf("�й� : %d", s.sno);
	printf("\n");
	printf("���� : %s", s.name);
	printf("\n");
	printf("������� : %d. %02d. %02d.", s.sd->year, s.sd->month, s.sd->day);


	return 0;
}



/*���� ��°��
�簢��: ����: 5000, 4���� ��:(10,20) (110,20) (110,70) (10,70)
�����͸� ����ü ����� �����ϴ� ���α׷�
 �й� : 20251234
 ���� : ȫ�浿
 ������� : 2002. 05. 05.
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
/*���� ��°��
�簢��: ����: 5000, 4���� ��:(10,20) (110,20) (110,70) (10,70)
�����͸� ����ü ����� �����ϴ� ���α׷�
�й� : 20251234
���� : ȫ�浿
������� : 2002. 05. 05.
*/