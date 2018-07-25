//: Playground - noun: a place where people can play

func isHappy(_ n: Int) -> Bool {
  var visitedNumbers = [Int]()
  var currentInt = n
  
  while !isPowerOfTen(n: currentInt) {
    let currentNumber = String(currentInt)
    var currentNumberList = currentNumber.map({Int(String($0))})
    var sum: Int = 0
    for i in 0..<currentNumberList.count {
      sum +=  currentNumberList[i]! * currentNumberList[i]!
    }

    if visitedNumbers.contains(sum) {
      return false
    } else {
      visitedNumbers.append(sum)
      currentInt = sum
    }
  }
  return true
}

func isPowerOfTen(n: Int) -> Bool {
  var input = n
  guard input > 0 else { return false }
  while input > 9 {
    if input%10 == 0 {
      input /= 10
    } else {
      return false
    }
  }
  return input==1
}

func getModuloAndCarryFor2Digit(num: Int) -> (modulo: Int, carry: Int) {
  let input = num
  guard input > 0 else { return (0,0)}
  if input < 10 {
    return (input,0)
  }
  else {
    let modulo = input%10
    let carry = input/10
    return (modulo, carry)
  }
}

getModuloAndCarryFor2Digit(num: 9)
getModuloAndCarryFor2Digit(num: 99)

isHappy(19)
isPowerOfTen(n: 90)

public struct Vertex: Equatable {
  public var data: String
  public var index: Int
  public var isVisited: Bool = false
  
  public init(data: String, index: Int) {
    self.data = data
    self.index = index
  }
  
  public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.data == rhs.data && lhs.index == rhs.index
  }
}

let a = Vertex(data: "A", index: 1)
let b = Vertex(data: "B", index: 2)
let c = Vertex(data: "C", index: 3)
a == b
let vertexList = [a, b]
vertexList.contains(c)

enum Directions: String {
  case east,west,north,south
  
  static var list: [Directions] {
    return [Directions.east, Directions.west, Directions.north, Directions.south]
  }
}

let dir = Directions.list.map({$0.rawValue})
dir

enum LightBulbStates {
  case On, Off
  
  mutating func toggle() -> LightBulbStates {
    switch self {
    case .Off:
      self = .On
      return self
    case .On:
      self = .Off
      return self
    }
  }
}

var bulbIsOff = LightBulbStates.Off
var bulbIsOn = bulbIsOff.toggle()
var bulbIsOffAgain = bulbIsOn.toggle()
var bulbIsOnAgain = bulbIsOffAgain.toggle()


enum Planets: Int {
  case Mercury = 1
  case Venus
  case Earth
  case Mars
  case Jupiter
  case Saturn
  case Uranus
  case Neptune
  case Pluto
  
  mutating func nextPlanet() {
    switch self {
    case .Mercury :
      self = .Venus
    case .Venus :
      self = .Earth
    case .Earth :
      self = .Mars
    case .Mars :
      self = .Jupiter
    case .Jupiter :
      self = .Saturn
    case .Saturn :
      self = .Uranus
    case .Uranus :
      self = .Neptune
    case .Neptune :
      self = .Pluto
    case .Pluto :
      self = .Mercury
    }
  }
}

var merc = Planets.Mercury
merc.nextPlanet()
merc.nextPlanet()
merc.nextPlanet()

if var jupiter = Planets(rawValue: 5) {
  jupiter.nextPlanet()
}
