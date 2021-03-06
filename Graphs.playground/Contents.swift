//: Playground - noun: a place where people can play

//let graph = AdjacencyListGraph<String>()
//
//// BFS and DFS graphs
//let a = graph.addVertex(data: "A")
//let b = graph.addVertex(data: "B")
//let c = graph.addVertex(data: "C")
//let d = graph.addVertex(data: "D")
//let e = graph.addVertex(data: "E")
//let f = graph.addVertex(data: "F")
//let g = graph.addVertex(data: "G")
//let h = graph.addVertex(data: "H")
//let i = graph.addVertex(data: "I")
//
//graph.addEdge(startVertex: a, endVertex: b)
//graph.addEdge(startVertex: a, endVertex: d)
//graph.addEdge(startVertex: a, endVertex: e)
//graph.addEdge(startVertex: d, endVertex: g)
//graph.addEdge(startVertex: g, endVertex: h)
//graph.addEdge(startVertex: b, endVertex: e)
//graph.addEdge(startVertex: e, endVertex: f)
//graph.addEdge(startVertex: e, endVertex: h)
//graph.addEdge(startVertex: c, endVertex: b)
//graph.addEdge(startVertex: f, endVertex: c)
//graph.addEdge(startVertex: f, endVertex: h)
//graph.addEdge(startVertex: h, endVertex: i)
//graph.addEdge(startVertex: i, endVertex: f)
//graph.edges.count
//
//graph.degreeOfVertex(vertex: a)
//graph.degreeOfVertex(vertex: b)
//graph.degreeOfVertex(vertex: c)
//graph.degreeOfVertex(vertex: d)
//graph.degreeOfVertex(vertex: e)
//graph.degreeOfVertex(vertex: f)
//graph.degreeOfVertex(vertex: g)
//graph.degreeOfVertex(vertex: h)
//graph.degreeOfVertex(vertex: i)
//
//graph.levelOrderTraversal(startVertex: a)
//graph.depthFirstSearch(startIndex: a)
//graph.hasCycle(startIndex: a)
//
//// topological sort graph
//let topoGraph = AdjacencyListGraph<String>()
//
//let c1 = topoGraph.addVertex(data: "CS1")
//let c2 = topoGraph.addVertex(data: "CS2")
//let c3 = topoGraph.addVertex(data: "CS3")
//let c4 = topoGraph.addVertex(data: "CS4")
//let c5 = topoGraph.addVertex(data: "CS5")
//let c6 = topoGraph.addVertex(data: "CS6")
//let c7 = topoGraph.addVertex(data: "CS7")
//let c8 = topoGraph.addVertex(data: "CS8")
//let c9 = topoGraph.addVertex(data: "CS9")
//let c10 = topoGraph.addVertex(data: "CS10")
//let c11 = topoGraph.addVertex(data: "CS11")
//
//topoGraph.addEdge(startVertex: c1, endVertex: c2)
//topoGraph.addEdge(startVertex: c2, endVertex: c3)
//topoGraph.addEdge(startVertex: c2, endVertex: c4)
//topoGraph.addEdge(startVertex: c2, endVertex: c5)
//topoGraph.addEdge(startVertex: c4, endVertex: c6)
//topoGraph.addEdge(startVertex: c4, endVertex: c7)
//topoGraph.addEdge(startVertex: c6, endVertex: c8)
//topoGraph.addEdge(startVertex: c7, endVertex: c8)
//topoGraph.addEdge(startVertex: c7, endVertex: c9)
//topoGraph.addEdge(startVertex: c9, endVertex: c10)
//topoGraph.addEdge(startVertex: c5, endVertex: c10)
//topoGraph.topologicalSort()
//
let simpleGraph = AdjacencyListGraph<Int>()
let a = simpleGraph.addVertex(data: 0)
let b = simpleGraph.addVertex(data: 1)
let c = simpleGraph.addVertex(data: 2)
simpleGraph.addEdge(startVertex: b, endVertex: a)
simpleGraph.addEdge(startVertex: b, endVertex: c)
simpleGraph.addEdge(startVertex: c, endVertex: b)
simpleGraph.hasCycle()
simpleGraph.depthFirstTraversalOrder()

//func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
//  let prerequisitesGraph = AdjacencyListGraph<Int>()
//   for i in 0..<prerequisites.count {
//     prerequisitesGraph.addVertex(data: prerequisites[i][0])
//     prerequisitesGraph.addVertex(data: prerequisites[i][1])
//   }
//  for vertex in prerequisitesGraph.vertices{
//    print(vertex.index, vertex.data)
//  }
//   for i in 0..<prerequisites.count {
//     prerequisitesGraph.addEdge(startVertex: prerequisitesGraph.getVertex(data: prerequisites[i][1]), endVertex:  prerequisitesGraph.getVertex(data: prerequisites[i][0]))
//   }
//
//  print("number of edges \(prerequisitesGraph.edges.count)")
//  for edge in prerequisitesGraph.edges {
//    print(edge.startVertex, edge.endVertex)
//  }
//  guard !prerequisitesGraph.hasCycle(startIndex: prerequisitesGraph.vertices[1]) else { return false }
//  return true
//   let sortedList = prerequisitesGraph.topologicalSort()
//  print("sorted list count: \(sortedList.count)")
//  return sortedList.count == numCourses
//}
//canFinish(3, [[1,0],[2,0],[0,2]])

