
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

struct point {
	int x, y;
};

int equal_value(struct point p1, struct point p2)
{
	//�Ʒ��� �ϼ��Ͻÿ�
	if (p1.x == p2.x && p1.y==p2.y) {
		return 1;
	}
	else
	{
		return 0;
	}


}

int equal_ref(struct point* p1, struct point* p2)
{
	//�Ʒ��� �ϼ��Ͻÿ�
	if (p1->x == p2->x && p1->y == p2->y) {
		return 1;
	}
	else
	{
		return 0;
	}

}

int quadrant(struct point p)
{
	//�Ʒ��� �ϼ��Ͻÿ�
	if (p.x > 0 && p.y > 0) {
		return 1;
	}
	else if (p.x < 0 && p.y > 0) {
		return 2;
	}
	else if (p.x < 0 && p.y < 0) {
		return 3;
	}
	else {
		return 4;
	}

}

double length(struct point p1, struct point p2) {
	//�Ʒ��� �ϼ��Ͻÿ�
	double dist = 0;
	dist = sqrt(((p1.x - p2.x) * (p1.x - p2.x)) + ((p1.y - p2.y) * (p1.y - p2.y)));
	return dist;

}
int main(void)
{
	//1,2��
	struct point p1 = { 1, 2 };
	struct point p2 = { 4, 6 };
	printf("��ġ ���� = %d\n", equal_value(p1, p2));
	printf("��ġ ���� = %d\n", equal_ref(&p1, &p2));

	//3��
	struct point p = { -1, 2 };
	printf("(%d, %d)�� ��и� = %d\n", p.x, p.y, quadrant(p));
	//3��

	//4��
	double d = length(p1, p2);
	printf("���� = %f\n", length(p1, p2));

	return 0;
}


/*���� ��°��
��ġ ���� = 0
��ġ ���� = 0
(-1, 2)�� ��и� = 2
���� = 5.000000
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
/*���� ��°��
��ġ ���� = 0
��ġ ���� = 0
(-1, 2)�� ��и� = 2
���� = 5.000000
*/
