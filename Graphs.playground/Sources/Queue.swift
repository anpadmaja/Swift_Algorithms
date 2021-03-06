//let q = Queue()
//q.enqueue(value: Vertex(data: "a", index: 1))
//q.enqueue(value: Vertex(data: "b", index: 2))
//q.enqueue(value: Vertex(data: "c", index: 3))
//q.listAll()
//q.dequeue()
//q.listAll()
//q.isEmpty
//

public class Queue<Element>: Equatable where Element: Hashable{
  public private(set) var list: [Vertex<Element>]
  
  public init() {
    list = [Vertex<Element>]()
  }
  
  public func enqueue(value: Vertex<Element>) {
    list.append(value)
  }
  
  public func dequeue() -> Vertex<Element> {
    return list.removeFirst()
  }
  
  public func contains(value: Vertex<Element>) -> Bool {
    return list.contains(value)
  }
  
  public var count : Int {
    return list.count
  }
  
  public func listAll() {
    for i in 0..<list.count {
      print(list[i])
    }
  }
  
  public var isEmpty: Bool {
    return list.isEmpty
  }
  
  public static func ==(lhs: Queue<Element>, rhs: Queue<Element>) -> Bool {
    return lhs.list == rhs.list
  }
  
}
