run
nbOfInfectedNeighborsOf: aNode
	^ (network edges
		select: [ :each | 
			| n1 n2 |
			n1 := each from.
			n2 := each to.
			(n1 ~= n2) and: [ 
			(n1 == aNode and: [ n2 currentStatus == #I ]) or: [ n2 == aNode and: [ n1 currentStatus == #I ]]]])size