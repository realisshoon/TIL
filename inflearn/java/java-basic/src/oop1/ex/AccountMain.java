package oop1.ex;

import java.util.Scanner;

public class AccountMain {
    public static void main(String[] args) {
        Account act = new Account();
        Scanner sc = new Scanner(System.in);

        int amount1 = sc.nextInt();

        // 계좌에 10000원을 입금
        act.deposit(amount1);
        System.out.println("현재 통장 잔고 : "+act.balance);

        // 계좌에서 9000원을 출금
        int amount2 = sc.nextInt();
        act.withdraw(amount2);

        // 계좌에서 2000원을 출금 시도 -> 잔액 부족 출력 확인
        int amount3 = sc.nextInt();
        act.withdraw(amount3);

        act.accountStatus();
    }
}
