import UIKit


//optional ?
//값이 있는지 없는지 모른다

var someVariable : Int? = nil //값을 아직 설정하지 않은 상태

if someVariable == nil {
    someVariable = 90  // ?로 optional 하게 설정되어 값이 optional로 나와있습니다.
}


print("someVariable :" , someVariable) //wrapping이 되어있어서 optional(90)

//unwrrapping ?
//감싸져 있는 것(optional)을 벗긴다.

//someVariable에 값이 있다면 otherVariable에 넣어서 쓰겠습니다.
if let otherVariable = someVariable {
    print("언래핑 되었다. 즉 값이 있다. otherVariable : \(otherVariable)") //unwrapping 되어서 90
}else{
        print("값이 없다.")
    }



someVariable = nil

//someVariable에 값이 없다면 기본값(10)을 넣겠다
let myValue = someVariable ?? 10
print("myValue : \(myValue)")



var firstValue : Int? = 30
var secondValue : Int? = 50

print("firstValue: \(firstValue)")
print("secondValue: \(secondValue)")
 
unwrap(firstValue)
unwrap(secondValue)

func unwrap(_ parameter: Int?){
    print("unwrap() called")
    //값이 없으면 리턴 해버림
    guard let unWrappedParam = parameter
    else {
        return
    }
    print("unWrappedParam: \(unWrappedParam)")
}


//unWrapping 하는 방법은( if let),(guard let + return) 두 가지 방법이 있다.
// value에 기본 값을 넣고 싶을때는 ??를 쓰면 된다.
