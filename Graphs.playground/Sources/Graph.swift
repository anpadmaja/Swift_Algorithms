import Foundation

public struct Vertex: Equatable {
  public var data: String
  public var index: Int
  
  public init(data: String, index: Int) {
    self.data = data
    self.index = index
  }
  
  public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.data == rhs.data
  }
}

public struct Edge: Equatable {
  public let startVertex: Vertex
  public let endVertex: Vertex
  public var weight: Double?
  
  public init(startVertex: Vertex, endVertex: Vertex, weight: Double? = nil) {
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

public class EdgeList {
  public var vertex: Vertex
  public var edges: [Edge]?
  
  public init(vertex: Vertex, edges:[Edge]? = nil) {
    self.vertex = vertex
  }
  
  public func addEdge(edge: Edge) {
    edges?.append(edge)
  }
}

public protocol BaseGraphProperties {
  var vertices: [Vertex] {get}
  var edges: [Edge] {get}
  var numberOfVertices: Int {get}
  var numberOfEdges: Int {get}
  func addVertex(data: String) -> Vertex
  func getVertex(data: String) -> Vertex
  func addEdge(startVertex: Vertex, endVertex: Vertex)
  func addEdge(startVertex: Vertex, endVertex: Vertex, weight: Double)
  func hasEdge(startVertex: Vertex, endVertex: Vertex) -> Bool
  func levelOrderTraversal(startVertex: Vertex) -> [Vertex]
}

public class AdjacencyListGraph: BaseGraphProperties {
  
  public var adjacencyList: [EdgeList] = []
  
  public var vertices: [Vertex] {
    var v = [Vertex]()
    for edgeList in adjacencyList {
      v.append(edgeList.vertex)
    }
    return v
  }
  
  public var numberOfVertices: Int {
    return vertices.count
  }
  
  public var edges: [Edge] {
    var e = [Edge]()
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
  
  public func addVertex(data: String) -> Vertex {
    let existingVertex: [Vertex] = vertices.filter { vertex in
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
  
  public func getVertex(data: String) -> Vertex {
    let existingVertex = vertices.filter { vertex in
        return vertex.data == data
    }
    return existingVertex.last!
  }
  
  public func addEdge(startVertex: Vertex, endVertex: Vertex) {
    
    let edgeToAdd = Edge(startVertex:startVertex, endVertex:endVertex) // edge to add between start and end vertices
    let edgelist = adjacencyList[startVertex.index]
    
    if edgelist.edges != nil {
      edgelist.addEdge(edge: edgeToAdd)
    } else {
      edgelist.edges = [edgeToAdd]
    }
  }
  
  public func addEdge(startVertex: Vertex, endVertex: Vertex, weight: Double){
    let edgeToAdd = Edge(startVertex:startVertex, endVertex:endVertex, weight: weight) // edge to add between start and end vertices
    let edgelist = adjacencyList[startVertex.index]
    
    if edgelist.edges != nil {
      edgelist.addEdge(edge: edgeToAdd)
    } else {
      edgelist.edges = [edgeToAdd]
    }
  }
  
  public func degreeOfVertex(vertex: Vertex) -> Int {
    let edgeList = adjacencyList[vertex.index]
    if let numberOfEgdes = edgeList.edges {
      return numberOfEgdes.count
    } else {
      return 0
    }
  }
  
  public func hasEdge(startVertex: Vertex, endVertex: Vertex) -> Bool {
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
  
  public func getNeighbors(startVertex: Vertex) -> [Vertex]? {
    var neighbors: [Vertex] = [Vertex]()
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
  
  public func levelOrderTraversal(startVertex: Vertex) -> [Vertex] {
    let unvisitedNeighborsQueue = Queue()
    let visitedVerticesQueue = Queue()
    
    unvisitedNeighborsQueue.enqueue(value: startVertex)
    while !unvisitedNeighborsQueue.isEmpty {
      let v = unvisitedNeighborsQueue.dequeue()
      if !visitedVerticesQueue.list.contains(v) {
        visitedVerticesQueue.enqueue(value: v)
      }
      if let neighbors: [Vertex] = getNeighbors(startVertex: v) {
        for n in neighbors {
          if !visitedVerticesQueue.list.contains(n) {
            unvisitedNeighborsQueue.enqueue(value: n)
          }
        }
      }
    }
    return visitedVerticesQueue.list
  }
  
  public func depthFirstSearch(startIndex: Vertex) -> [Vertex] {
    let visitedNeighQueue = Queue()
    let unvisitedNeighStack = Stack()
    
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
}
