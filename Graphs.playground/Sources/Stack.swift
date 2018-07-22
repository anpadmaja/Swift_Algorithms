import Foundation

//let s = Stack()
//s.count
//s.listAll()
//s.push(value: Vertex(data: "a", index: 1))
//s.push(value: Vertex(data: "b", index: 2))
//s.push(value: Vertex(data: "c", index: 3))
//s.listAll()
//s.count
//s.isEmpty
//s.pop()
//s.listAll()
//s.count
//s.peek()

// END Of testing Queue impl

public class Stack<Element>: Equatable where Element: Hashable {
  private(set) var list: [Vertex<Element>]
  public var isEmpty: Bool {
    return list.isEmpty
  }
  
  public init() {
    list = [Vertex<Element>]()
  }
  
  public func push(value: Vertex<Element>) {
    list.append(value)
  }
  
  public func pop() -> Vertex<Element> {
    return list.removeLast()
  }
  
  public func peek() -> Vertex<Element> {
    return list[count-1]
  }
  
  public func clear() {
    list = [Vertex]()
  }
  
  public var count : Int {
    return list.count
  }
  
  public func contains(value: Vertex<Element>) -> Bool {
    return list.contains(value)
  }
  
  public func listAll() {
    for i in 0..<list.count {
      print(list[i])
    }
  }
  
  public static func ==(lhs: Stack<Element>, rhs: Stack<Element>) -> Bool {
    return lhs.list == rhs.list
  }
}
