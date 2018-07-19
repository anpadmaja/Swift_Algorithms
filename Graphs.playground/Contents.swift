//: Playground - noun: a place where people can play

let graph = AdjacencyListGraph()

let a = graph.addVertex(data: "A")
let b = graph.addVertex(data: "B")
let c = graph.addVertex(data: "C")
let d = graph.addVertex(data: "D")
let e = graph.addVertex(data: "E")
let f = graph.addVertex(data: "F")
let g = graph.addVertex(data: "G")
let h = graph.addVertex(data: "H")
let i = graph.addVertex(data: "I")

graph.addEdge(startVertex: a, endVertex: b)
graph.addEdge(startVertex: a, endVertex: d)
graph.addEdge(startVertex: a, endVertex: e)
graph.addEdge(startVertex: d, endVertex: g)
graph.addEdge(startVertex: g, endVertex: h)
graph.addEdge(startVertex: b, endVertex: e)
graph.addEdge(startVertex: e, endVertex: f)
graph.addEdge(startVertex: e, endVertex: h)
graph.addEdge(startVertex: c, endVertex: b)
graph.addEdge(startVertex: f, endVertex: c)
graph.addEdge(startVertex: f, endVertex: h)
graph.addEdge(startVertex: h, endVertex: i)
graph.addEdge(startVertex: i, endVertex: f)
graph.edges.count

graph.degreeOfVertex(vertex: a)
graph.degreeOfVertex(vertex: b)
graph.degreeOfVertex(vertex: c)
graph.degreeOfVertex(vertex: d)
graph.degreeOfVertex(vertex: e)
graph.degreeOfVertex(vertex: f)
graph.degreeOfVertex(vertex: g)
graph.degreeOfVertex(vertex: h)
graph.degreeOfVertex(vertex: i)

graph.levelOrderTraversal(startVertex: a)
graph.depthFirstSearch(startIndex: a)

