////: Playground - noun: a place where people can play
//
//func isHappy(_ n: Int) -> Bool {
//  var visitedNumbers = [Int]()
//  var currentInt = n
//
//  while !isPowerOfTen(n: currentInt) {
//    let currentNumber = String(currentInt)
//    var currentNumberList = currentNumber.map({Int(String($0))})
//    var sum: Int = 0
//    for i in 0..<currentNumberList.count {
//      sum +=  currentNumberList[i]! * currentNumberList[i]!
//    }
//
//    if visitedNumbers.contains(sum) {
//      return false
//    } else {
//      visitedNumbers.append(sum)
//      currentInt = sum
//    }
//  }
//  return true
//}
//
//func isPowerOfTen(n: Int) -> Bool {
//  var input = n
//  guard input > 0 else { return false }
//  while input > 9 {
//    if input%10 == 0 {
//      input /= 10
//    } else {
//      return false
//    }
//  }
//  return input==1
//}
//
//func getModuloAndCarryFor2Digit(num: Int) -> (modulo: Int, carry: Int) {
//  let input = num
//  guard input > 0 else { return (0,0)}
//  if input < 10 {
//    return (input,0)
//  }
//  else {
//    let modulo = input%10
//    let carry = input/10
//    return (modulo, carry)
//  }
//}
//
//getModuloAndCarryFor2Digit(num: 9)
//getModuloAndCarryFor2Digit(num: 99)
//
//isHappy(19)
//isPowerOfTen(n: 90)
//
//public struct Vertex: Equatable {
//  public var data: String
//  public var index: Int
//  public var isVisited: Bool = false
//
//  public init(data: String, index: Int) {
//    self.data = data
//    self.index = index
//  }
//
//  public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
//    return lhs.data == rhs.data && lhs.index == rhs.index
//  }
//}
//
//let a = Vertex(data: "A", index: 1)
//let b = Vertex(data: "B", index: 2)
//let c = Vertex(data: "C", index: 3)
//a == b
//let vertexList = [a, b]
//vertexList.contains(c)
//
//enum Directions: String {
//  case east,west,north,south
//
//  static var list: [Directions] {
//    return [Directions.east, Directions.west, Directions.north, Directions.south]
//  }
//}
//
//let dir = Directions.list.map({$0.rawValue})
//dir
//
//enum LightBulbStates {
//  case On, Off
//
//  mutating func toggle() -> LightBulbStates {
//    switch self {
//    case .Off:
//      self = .On
//      return self
//    case .On:
//      self = .Off
//      return self
//    }
//  }
//}
//
//var bulbIsOff = LightBulbStates.Off
//var bulbIsOn = bulbIsOff.toggle()
//var bulbIsOffAgain = bulbIsOn.toggle()
//var bulbIsOnAgain = bulbIsOffAgain.toggle()
//
//
//enum Planets: Int {
//  case Mercury = 1
//  case Venus
//  case Earth
//  case Mars
//  case Jupiter
//  case Saturn
//  case Uranus
//  case Neptune
//  case Pluto
//
//  mutating func nextPlanet() {
//    switch self {
//    case .Mercury :
//      self = .Venus
//    case .Venus :
//      self = .Earth
//    case .Earth :
//      self = .Mars
//    case .Mars :
//      self = .Jupiter
//    case .Jupiter :
//      self = .Saturn
//    case .Saturn :
//      self = .Uranus
//    case .Uranus :
//      self = .Neptune
//    case .Neptune :
//      self = .Pluto
//    case .Pluto :
//      self = .Mercury
//    }
//  }
//}
//
//var merc = Planets.Mercury
//merc.nextPlanet()
//merc.nextPlanet()
//merc.nextPlanet()
//
//if var jupiter = Planets(rawValue: 5) {
//  jupiter.nextPlanet()
//}
//
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

class Queue<Element> : Equatable where Element: Hashable {
  private var list: [Element]
  init() {
    list = [Element]()
  }
  func enqueue(_ value: Element) {
    list.append(value)
  }
  func dequeue() -> Element {
    return list.removeFirst()
  }
  func peek() -> Element? {
    return list.first
  }

  public static func ==(lhs: Queue, rhs: Queue) -> Bool {
    return lhs.list == rhs.list
  }

  public func isEmpty() -> Bool {
    return list.isEmpty
  }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
  if l1 == nil && l2 == nil { return nil }

  var carry = 0
  var val1 = 0
  var val2 = 0
  let queue = Queue<Int>()
  var currentl1 = l1
  var currentl2 = l2

  let head: ListNode?
  var current: ListNode?
  head = current

  while (currentl1 != nil || currentl2 != nil) {
    if let list1 = currentl1 {
      val1 = list1.val
    } else { val1 = 0 }

    if let list2 = currentl2 {
      val2 = list2.val
    } else { val2 = 0 }

    let sum = val1+val2+carry
    if sum >= 10 {
      let result = calculateCarryAndModulo(sum)
      carry = result.carry
      queue.enqueue(result.modulo)
    } else {
      carry = 0
      queue.enqueue(sum)
    }
    currentl1 = currentl1?.next
    currentl2 = currentl2?.next
  }

  while !queue.isEmpty() {
    let val = queue.dequeue()
    print("value in queue: \(val)")
    let node = ListNode(val)
    if current != nil {
      current?.next = node
      current = current?.next
    } else {
      current = node
    }
  }
  return head
}

func calculateCarryAndModulo(_ num: Int) -> (carry: Int, modulo: Int) {
  let input = num
  guard input != 0 else { return (carry: 0, modulo: 0) }
  if input < 9 {
    return (carry: 0, modulo: input)
  } else {
    let modulo = input%10
    let carry = input/10
    return (carry: carry, modulo: modulo)
  }
}

func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
  guard buckets != 0 else { return 0 }
  guard buckets < 5 else { return 1 }
  let minNumberOfPigsPerHour = 60/minutesToDie
  var returnNumber = Double(buckets/minNumberOfPigsPerHour)
  returnNumber.round(.up)
  return Int(returnNumber)
}

class Solution {
  func maxArea(_ height: [Int]) -> Int {
    guard height.count > 1 else { return 0 }
    var heightArr = height
    var maxArea = 0
    var i = 0
    var j = heightArr.count - 1
   
    while i < j {
      let length = j-i
      var breadth: Int
      if heightArr[i] < heightArr[j] {
        breadth = heightArr[i]
        i+=1
      } else {
        breadth = heightArr[j]
        j-=1
      }
      let area = length*breadth
      maxArea = area > maxArea ? area : maxArea
    }
    return maxArea
  }
  
  func maxArea1(_ height: [Int]) -> Int {
    var i = 0
    var j = height.count - 1
    var water = 0
    var currentHeight = 0
    var width = 0
    while i < j {
      currentHeight = min(height[i], height[j])
      width = j - i
      water = max(water, currentHeight*width)
      if height[i] < height[j]{
        i += 1
      } else {
        j -= 1
      }
    }
    return water
  }
}

// comment out to compile
abs(<#T##x: Comparable & SignedNumeric##Comparable & SignedNumeric#>)
min(<#T##x: Comparable##Comparable#>, <#T##y: Comparable##Comparable#>)
max(<#T##x: Comparable##Comparable#>, <#T##y: Comparable##Comparable#>)
String(str.index(str.startIndex, offsetBy: i))
[array]+[array]
array.insert(val, at:0)
array.prefix
dict: [Int: Int]()
if let nbr = dict[0] {}
findmoduloandcarry = nbr%10, nbr/10
