import Foundation

public struct Vertex<Element>: Equatable where Element:Hashable {
  public var data: Element
  public var index: Int
  
  public init(data: Element, index: Int) {
    self.data = data
    self.index = index
  }
  
  public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.data == rhs.data
  }
}

public struct Edge<Element>: Equatable where Element:Hashable {
  public let startVertex: Vertex<Element>
  public let endVertex: Vertex<Element>
  public var weight: Double?
  
  public init(startVertex: Vertex<Element>, endVertex: Vertex<Element>, weight: Double? = nil) {
    self.startVertex = startVertex
    self.endVertex = endVertex
    self.weight = weight
  }
  
  public static func ==(lhs: Edge,  rhs: Edge) -> Bool {
    return lhs.startVertex == rhs.startVertex
      && lhs.endVertex == rhs.endVertex
      && lhs.weight == rhs.weight
  }
}

public class EdgeList<Element>: Equatable where Element:Hashable {
  public var vertex: Vertex<Element>
  public var edges: [Edge<Element>]?
  
  public init(vertex: Vertex<Element>, edges:[Edge<Element>]? = nil) {
    self.vertex = vertex
  }
  
  public func addEdge(edge: Edge<Element>) {
    edges?.append(edge)
  }
  
  public static func ==(lhs: EdgeList,  rhs: EdgeList) -> Bool {
    return lhs.vertex == rhs.vertex
  }
}

public protocol BaseGraphProperties {
  associatedtype V
  associatedtype E
  associatedtype Element
  var vertices: [V] {get}
  var edges: [E] {get}
  var numberOfVertices: Int {get}
  var numberOfEdges: Int {get}
  func addVertex(data: Element) -> V
  func getVertex(data: Element) -> V
  func addEdge(startVertex: V, endVertex: V)
  func addEdge(startVertex: V, endVertex: V, weight: Double)
  func hasEdge(startVertex: V, endVertex: V) -> Bool
  func levelOrderTraversal(startVertex: V) -> [V]
}

public class AdjacencyListGraph<Element>: BaseGraphProperties, Equatable where Element:Hashable {
  
  public typealias V = Vertex<Element>
  public typealias E = Edge<Element>
  public typealias Element = String
  
  public static func ==(lhs: AdjacencyListGraph,  rhs: AdjacencyListGraph) -> Bool {
    return true
  }
  
  public var adjacencyList: [EdgeList] = [EdgeList<Element>]()
  
  public var vertices: [V] {
    var v = [V]()
    for edgeList in adjacencyList {
      v.append(edgeList.vertex)
    }
    return v
  }
  
  public var numberOfVertices: Int {
    return vertices.count
  }
  
  public var edges: [E] {
    var e = [E]()
    for list in adjacencyList {
      guard let edgesCount = list.edges else { continue }
      for edge in edgesCount {
        e.append(edge)
      }
    }
    return e
  }
  
  public var numberOfEdges: Int {
    return edges.count
  }
  
  public init() {}
  
  public func addVertex(data: Element) -> V {
    let existingVertex: [V] = vertices.filter { vertex in
      return vertex.data == data
    }
    guard existingVertex.count == 0 else {
      return existingVertex.last!
    }
    let v = Vertex(data: data, index: adjacencyList.count)
    let edgeList = EdgeList(vertex: v)
    adjacencyList.append(edgeList)
    return v
  }
  
  public func getVertex(data: Element) -> V {
    let existingVertex = vertices.filter { vertex in
      return vertex.data == data
    }
    return existingVertex.last!
  }
  
  public func addEdge(startVertex: V, endVertex: V) {
    
    let edgeToAdd = Edge(startVertex:startVertex, endVertex:endVertex) // edge to add between start and end vertices
    let edgelist = adjacencyList[startVertex.index]
    
    if edgelist.edges != nil {
      edgelist.addEdge(edge: edgeToAdd)
    } else {
      edgelist.edges = [edgeToAdd]
    }
  }
  
  public func addEdge(startVertex: V, endVertex: V, weight: Double){
    let edgeToAdd = Edge(startVertex:startVertex, endVertex:endVertex, weight: weight) // edge to add between start and end vertices
    let edgelist = adjacencyList[startVertex.index]
    
    if edgelist.edges != nil {
      edgelist.addEdge(edge: edgeToAdd)
    } else {
      edgelist.edges = [edgeToAdd]
    }
  }
  
  public func degreeOfVertex(vertex: V) -> Int {
    let edgeList = adjacencyList[vertex.index]
    if let numberOfEgdes = edgeList.edges {
      return numberOfEgdes.count
    } else {
      return 0
    }
  }
  
  public func hasEdge(startVertex: V, endVertex: V) -> Bool {
    let edgeList = adjacencyList[startVertex.index]
    if let edges = edgeList.edges {
      for edge in edges {
        if edge.endVertex.data == endVertex.data {
          return true
        }
      }
    }
    return false
  }
  
  public func getNeighbors(startVertex: V) -> [V]? {
    var neighbors: [V] = [V]()
    let edgeList = adjacencyList[startVertex.index]
    if let edges = edgeList.edges {
      for edge in edges {
        neighbors.append(edge.endVertex)
      }
      return neighbors
    } else {
      return nil
    }
  }
  
  public func hasCycle(startIndex: V) -> Bool {
    let unvisitedNeighborsStack = Stack<Element>()
    let visitedNeighborsQueue = Queue<Element>()

    unvisitedNeighborsStack.push(value: startIndex)
    visitedNeighborsQueue.enqueue(value: startIndex)
    
    while !unvisitedNeighborsStack.isEmpty {
      let currentVertex = unvisitedNeighborsStack.peek()
      if let neighbor1 = getNeighbors(startVertex: currentVertex)?.filter({ !visitedNeighborsQueue.contains(value: $0) }).first {
        unvisitedNeighborsStack.push(value: neighbor1)
        visitedNeighborsQueue.enqueue(value: neighbor1)
      } else {
        if let _ = getNeighbors(startVertex: currentVertex)?.filter({ unvisitedNeighborsStack.contains(value: $0) }).first {
          return true
        } else {
          print("poping out of the stack")
          _ = unvisitedNeighborsStack.pop()
        }
      }
    }
    return false
  }
  
  public func levelOrderTraversal(startVertex: V) -> [V] {
    let unvisitedNeighborsQueue = Queue<Element>()
    let visitedVerticesQueue = Queue<Element>()
    
    unvisitedNeighborsQueue.enqueue(value: startVertex)
    while !unvisitedNeighborsQueue.isEmpty {
      let v = unvisitedNeighborsQueue.dequeue()
      if !visitedVerticesQueue.list.contains(v) {
        visitedVerticesQueue.enqueue(value: v)
      }
      if let neighbors: [V] = getNeighbors(startVertex: v) {
        for n in neighbors {
          if !visitedVerticesQueue.list.contains(n) {
            unvisitedNeighborsQueue.enqueue(value: n)
          }
        }
      }
    }
    return visitedVerticesQueue.list
  }
  
  public func depthFirstSearch(startIndex: V) -> [V] {
    let visitedNeighQueue = Queue<Element>()
    let unvisitedNeighStack = Stack<Element>()
    
    // push the startverted to stack
    unvisitedNeighStack.push(value: startIndex)
    visitedNeighQueue.enqueue(value: startIndex)
    // mark it visited and enqueue in the queue
    
    while !unvisitedNeighStack.isEmpty {
      let currentVertex = unvisitedNeighStack.peek()
      if let unvisitedNeighbor1 = getNeighbors(startVertex: currentVertex)?.filter({ !visitedNeighQueue.contains(value: $0) }).first {
        unvisitedNeighStack.push(value: unvisitedNeighbor1)
        visitedNeighQueue.enqueue(value: unvisitedNeighbor1)
      } else {
        _ = unvisitedNeighStack.pop()
      }
    }
    return visitedNeighQueue.list
  }
  
  public func topologicalSort() -> [V] {
    var returnList = [V]()
    let visitedNeighborsStack = Stack<Element>()
    let unvisitedNeighborsStack = Stack<Element>()
    
    for i in 0..<adjacencyList.count {
      let currentVertex = adjacencyList[i].vertex
      if let neighborsList = getNeighbors(startVertex: currentVertex)?.filter({ !visitedNeighborsStack.contains(value: $0) }) {
        if neighborsList.count == 0 {
          visitedNeighborsStack.push(value: currentVertex)
        } else {
          unvisitedNeighborsStack.push(value: currentVertex)
        }
      } else {
        visitedNeighborsStack.push(value: currentVertex)
      }
    }
    while !unvisitedNeighborsStack.isEmpty {
      let currentVertex = unvisitedNeighborsStack.pop()
      visitedNeighborsStack.push(value: currentVertex)
    }
    
    while !visitedNeighborsStack.isEmpty {
      returnList.append(visitedNeighborsStack.pop())
    }
    return returnList
  }
}

