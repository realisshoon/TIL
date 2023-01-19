
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
	//아래를 완성하시오
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
	//아래를 완성하시오
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
	//아래를 완성하시오
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
	//아래를 완성하시오
	double dist = 0;
	dist = sqrt(((p1.x - p2.x) * (p1.x - p2.x)) + ((p1.y - p2.y) * (p1.y - p2.y)));
	return dist;

}
int main(void)
{
	//1,2번
	struct point p1 = { 1, 2 };
	struct point p2 = { 4, 6 };
	printf("일치 여부 = %d\n", equal_value(p1, p2));
	printf("일치 여부 = %d\n", equal_ref(&p1, &p2));

	//3번
	struct point p = { -1, 2 };
	printf("(%d, %d)의 사분면 = %d\n", p.x, p.y, quadrant(p));
	//3번

	//4번
	double d = length(p1, p2);
	printf("길이 = %f\n", length(p1, p2));

	return 0;
}


/*예시 출력결과
일치 여부 = 0
일치 여부 = 0
(-1, 2)의 사분면 = 2
길이 = 5.000000
계속하려면 아무 키나 누르십시오 . . .
*/
/*실제 출력결과
일치 여부 = 0
일치 여부 = 0
(-1, 2)의 사분면 = 2
길이 = 5.000000
*/
