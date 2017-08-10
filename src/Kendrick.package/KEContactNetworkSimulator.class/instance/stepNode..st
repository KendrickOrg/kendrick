run
stepNode: aNode
	| n p |
	n := self nbOfInfectedNeighborsOf: aNode.
	aNode nextStatus: (aNode currentStatus).
	aNode currentStatus == #S
		ifTrue: [ p := 1 -((1-rho)raisedTo:n).
			"p := 1 - (Float e raisedTo: (tau * stepTime * n) negated)."
			p > 1.0 random
				ifTrue: [ aNode nextStatus: #I ]
				].
	aNode currentStatus == #I
		ifTrue: [ p:=gamma.
			"p := Float e raisedTo: (gamma * stepTime) negated."
			p > 1.0 random
				ifTrue: [ aNode nextStatus: #R ] ]