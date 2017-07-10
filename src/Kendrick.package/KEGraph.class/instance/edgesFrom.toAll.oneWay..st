public
edgesFrom: aNode toAll: otherNodes oneWay: boolean
	otherNodes do: [ :n|
		edges add: aNode->n. 
		(self atNode: aNode) addAdjacentNode: n.
		boolean ifFalse: [ 
			edges add: n->aNode.
			(self atNode: n) addAdjacentNode: aNode ]
	]