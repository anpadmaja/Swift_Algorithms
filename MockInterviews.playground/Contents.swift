//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, world"

func reverseString(_ str: String) -> String {
  let strArray = Array(str)
  var output: [String] = [String]()
  for i in (0..<strArray.count).reversed() {
    output.append(String(strArray[i]))
  }
  return output.joined()
}

func reverseWithConstantTimeAndSpace(_ str: String) -> String {
  var returnString = String()
  for i in (0..<str.count).reversed() {
    let currentIndex = str.index(str.startIndex, offsetBy: i)
    returnString.append(str[currentIndex])
  }
  return returnString
}
reverseWithConstantTimeAndSpace(str)

func returnSubstring(_ str: String) -> String {
  let startIndex = str.index(str.endIndex, offsetBy: -5)
  return String(str[startIndex..<str.endIndex])
}
returnSubstring(str)

func oddNumbers(_ limit: Int) {
  var n = 1
  while n < limit {
    print(n)
    n += 2
  }
}

oddNumbers(10)

func maxFromList(_ list: [Int]) -> Int {
  var min = Int.max
  for i in 0..<list.count {
    if list[i] < min {
      min = list[i]
    }
  }
  return min
}

let list = [Int](stride(from: 0, to: 20, by: 1))
print(maxFromList(list))

class MyTestClass: UIView {
  
}
