import UIKit

var myAge = 0{
    willSet{ //값이 저장되기 직전에 호출
        print("값이 설정 될 예정 myAge: \(myAge)")
    }
    didSet{ //값이 저장되면 호출
        print("값이 설정됨 myAge: \(myAge)")
    }
}

myAge = 10
myAge = 20

//값의 변경을 알 수 있음.


