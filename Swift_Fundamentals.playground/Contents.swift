//: Playground - noun: a place where people can play

import UIKit

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

