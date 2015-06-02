as yet unclassified
with: anEdge strengthOfConnection: rtValue oneWay: flag
	"|index1 index2 labels|
	labels := nodes collect: [ :e| e label ].
	index1 := labels indexOf: (anEdge at: 1).
	index2 := labels indexOf: (anEdge at: 2).
	(nodes at: index1) addAdjacentNode: (anEdge at: 2)->rtValue.
	(nodes at: index2) addAdjacentNode: (anEdge at: 1)->rtValue"
	(self atNode: (anEdge at: 1)) addAdjacentNode: ((self atNode: (anEdge at: 2)) label)->rtValue.
	flag ifFalse: [ (self atNode: (anEdge at: 2)) addAdjacentNode: ((self atNode: (anEdge at: 1)) label)->rtValue ]
	