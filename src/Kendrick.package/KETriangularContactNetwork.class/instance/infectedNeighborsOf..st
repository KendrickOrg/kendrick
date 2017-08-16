metrics
infectedNeighborsOf: aNode
	"Return infected nodes"

	| toNodes fromNodes infectedNodes |
	fromNodes := ( edges
		select: [ :each | 
			| n1 n2 |
			n1 := each from.
			n2 := each to.
			n1 ~= n2 and: [ n1 == aNode and: [ n2 currentStatus == #I ] ] ]) collect: #to.
	toNodes := ( edges
		select: [ :each | 
			| n1 n2 |
			n1 := each from.
			n2 := each to.
			n1 ~= n2 and: [ n2 == aNode and: [ n1 currentStatus == #I ] ] ]) collect: #from.
	infectedNodes := Set new.
	infectedNodes
		addAll: fromNodes;
		addAll: toNodes.
	^ infectedNodes