run
stepNode: aNode
	| n p |
	n := self nbOfInfectedNeighborsOf: aNode.
	aNode nextStatus: aNode currentStatus.
	aNode currentStatus == #S
		ifTrue: [ p := 1 - (1 - rho raisedTo: n).
			p > 1.0 random
				ifTrue: [ aNode nextStatus: #I.self updateGenInfected: aNode ] ].
	aNode currentStatus == #I
		ifTrue: [ p := gamma.
			p > 1.0 random
				ifTrue: [ aNode nextStatus: #R ] ]