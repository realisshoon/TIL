import UIKit

// struct(구조체)
// 생성자를 만들지 않아도 좋다.(자동생성)
struct YoutuberSturct{
    var name : String
    var subscribersCount : Int
}

var seungHun = YoutuberSturct(name : "SeungHun", subscribersCount: 999999)
var seungHunClone = seungHun

print("===========Struct===========")
print("변경 전 SeungHunClone.name : \(seungHunClone.name)")
seungHunClone.name = "iamseungman"

// Call by Value
// 서로 다른 메모리를 사용하기 때문에 SeungHunClone을 아무리 변경해도 원래 값은 변하지 않음
print("변경 후 struct - SeungHunClone.name : \(seungHunClone.name)")
print("변경 후 struct - SeungHun.name : \(seungHun.name)")


// class

class YoutuberClass{
    var name : String
    var subscribersCount : Int
    
    //생성자 메소드를 만들어야 매개변수 넣고 객체 생성 가능
    init(name: String, subscribersCount: Int){
        self.name = name
        self.subscribersCount = subscribersCount
    }
}

var han = YoutuberClass(name : "austin", subscribersCount: 999999)
var realisshoon = han

print("===========Class===========")
print("변경 전 realisshoon.name : \(realisshoon.name)")
realisshoon.name = "iamseungman"

// Call by reference
// 같은 메모리에서 값을 참조하기 때문에 realisshoon을 변경하면 값이 둘 다 변함
print("변경 후 struct - realisshoon.name : \(realisshoon.name)")
print("변경 후 struct - han.name : \(han.name)")

