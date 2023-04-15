import UIKit

/* 변수와 상수*/
import Swift

//상수 변수 선언
//상수 선언 : let
let constant: String = "차후에 변경이 불가능한 상수 let"
//변수 선언 : var
var variable:String = "차후에 변경이 가능한 변수 var"

let sum : Int
let inputA : Int = 100
let inputB : Int = 200

//상수 선언후 첫 할당
sum = inputA + inputB //이후에는 값을 변경할 수 없음

var nickName : String
nickName="austin"
nickName="realisshoon" //변수는 추후에 다시 다른 값을 할당 할 수 있음



/*기본 데이터 타입*/
//Bool,Int,UInt,Float,Double,Character,String
//swift는 데이터 타입에 굉장히 엄격함

//Bool
var someBool : Bool = true
someBool=false
//int형이라 Error
//someBool = 0
//someBool = 1

//UInt 부호가 없는 정수
var someUInt: UInt = 100
//someUInt=-100 부호가 있어서 error

//Character
var SomeCharacter :Character = "가"
//SomeCharacter = "하하하" 문자 타입인데 문자열이여서 error

/* Any, AnyObject, nil*/

//Any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능하다"
someAny = "Swift의 모든 타입을 지칭하는 키워드"

//AnyObject
class SomeClass{}

var SomeAnyObject : AnyObject = SomeClass()

//AnyObject는 클래스의 인스턴스만 수용 가능하기 때문에 클래스의 인스턴스가 아니면 할당할 수 없음.

//nil 다른 언어의 null 과 같은 의미

/*컬랙션 타입*/
/*
 Array : 순서가 있는 리스트 컬렉션
 Dictionary : key-value 쌍으로 이루어진 컬렉션
 Set : 순서가 없고 멤버가 유일한 컬렉션
 */

//Array
var integers : Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)

//요소가 배열에 포함 되어 있는가?
integers.contains(100)
integers.contains(99)

//0번 인덱스를 제거
integers.remove(at : 0)
integers.removeLast()
integers.removeAll()

integers.count

integers.append(1)
integers[0]

var doubles : Array<Double> = [Double]()












//// 다크모드 여부
//var isDarkMode : Bool=true
//
//
//if(isDarkMode==true){
//    print("다크모드입니다.")
//} else{
//    print("다크모드 아닙니다")
//}
//
//if isDarkMode {
//    print("다크모드입니다.")
//} else{
//    print("다크모드 아닙니다")
//}
//
//var title : String = isDarkMode == true ? "다크모드입니다" : "다크모드가 아닙니다"
//print("title: \(title)")










////enum
////학교-초,중,고
//enum School{
////    case elementary
////    case middle
////    case high
//    case elementary,middle,high
//}
//
//let yourSchool=School.high
////print("yourSchool : \(yourSchool)")
//print("yourSchool: ",yourSchool)
//
//enum Grade: Int{
//    case first=1
//    case second=2
//}
//
//let yourGrade=Grade.second.rawValue
//print("yourGrade: \(yourGrade)")
//
//enum SchoolDetail{
//    case elementary(name: String)
//    case middle(name: String)
//    case high(name: String)
//
//    func getName()->String{
//        switch self{
//        case .elementary(let name):
//            return name
//        case .middle(let name):
//            return name
//        case .high(let name):
//            return name
//        }
//    }
//}
//
//let yourMiddleSchoolName=SchoolDetail.middle(name: "병점중학교")
//
//print("yourMiddleSchoolName : \(yourMiddleSchoolName.getName())")
//
////range
////0 ...5 ==0,1,2,3,4,5
////0..<5 ==0,1,2,3,4
//for index in 0..<5 where index % 2==0{
//    print("호호 index: \(index)")
//}
//
//var randomInts: [Int]=[]
////var randomInts: [Int]=[Int]()
//
//for _ in 0..<25{
//    let randomNumber=Int.random(in: 0...100)
//    randomInts.append(randomNumber)
//}
//
//print("randomInts: \(randomInts)")
//
//
////optional 이란?
////값이 있다 없다
//var someVariable : Int? = nil
//
//if someVariable == nil{
//    someVariable=90
//}
//
////Unwrap ? 감싸져 있는 것을 벗기는 것
//if let otherVariable=someVariable{
//    print("언래핑 되었다. 즉 값이 있다. otherVariable: \(otherVariable)")
//} else{
//    print("값이 없다.")
//}
//
//someVariable=nil
//
////someVariable 값이 없으면 기본값으로 요놈을 넣겠다
//let myValue=someVariable ?? 10
//print("myValue: \(myValue)")
//
//var firstValue : Int?=30
//var secondValue : Int?=50
//
//
//func unwrap(parameter: Int?){
//    print("unwrap() called")
//
//    //값이 없으면 리턴
//    guard let unWrappedParam=parameter else{
//        return
//    }
//    print("unWrappedParam: \(unWrappedParam)")
//}
