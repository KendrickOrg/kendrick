run
stepNode: aNode
	| n p |
	n := self nbOfInfectedNeighborsOf: aNode.
	aNode currentStatus == #S
		ifTrue: [ p := 1 - (Float e raisedTo: (tau * stepTime * n) negated).
			p > 1.0 random
				ifTrue: [ aNode nextStatus: #I ] ].
	aNode currentStatus == #I
		ifTrue: [  p := Float e raisedTo: (gamma * stepTime) negated.
			p > 1.0 random
				ifTrue: [ aNode nextStatus: #R ] ]