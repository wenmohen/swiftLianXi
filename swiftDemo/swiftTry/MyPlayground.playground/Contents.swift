//: Playground - noun: a place where people can play

import UIKit

var myArr1 = ["买","不买","等等"]

myArr1.append("am")

myArr1.insert("afsd", at: 3)


let emptyArray = [String]()

let emptyDictionary = [String: Float]()

var oos=["namesd":"zhds","age":"34"]
oos["age"]="354"
oos["mkk"]="kkad"

//oos["mkk"]=nil
oos.removeValue(forKey: "namesd")
print(oos)
print("数组长度"+String( oos.count))
print("数组长度：\(oos.count)")

for (key,value) in oos {
    print("\(key):\(value)")
}

for key in oos.keys {
    print("key:\(key)")
}

for key in myArr1 {
    print(key)
}

let myDDaRR1=Array(oos.keys)

let (x,y)=(2,2)
print(x)

let mma=(502,"bad")

print(mma)

let (m,n)=mma
print(n)
let (j,_)=mma
print(mma.1)

let kkd=(m:"23",n:"345")
print(kkd.m)


var rescode:String?
let has=rescode?.hashValue
print(has)
rescode=nil


















//let myString = "这是第一个swift程序";
//let myName = "qewqr";
//var age = 22;
//age=30;
//
//var bname="hh";
//bname="信号";
//let score="30分";
//
//
//let teacher:String="张宏"
//
//
//let  你好="无线互联"
//
//
//typealias NSString = String;
//let nameds:NSString="hello"
//
//
//let word="the is width"
//let width=23
//var mat = word+String(width);
//mat += "!"
//
//
//let str1=12;
//let str2=44;
//let str3="我有 \(str1) 苹果"
//let str4="我有个 \(str2+str1) 栗子"
//
//print("分数为：\(score)");
//print("内容：\(bname)");
//print("\(myName)的内容为:\(myString)sdddd\(age)");
//print("老师的名字：\(teacher)")
//print("中文定义常量：\(你好)")
//print(nameds)
//print(mat);
//print(str3)
//print(str4)
