metrics
neighborsOf: aNode
	"Return neighbors nodes"

	| toNodes fromNodes allNodes |
	fromNodes := ( edges
		select: [ :each | 
			| n1 n2 |
			n1 := each from.
			n2 := each to.
			n1 ~= n2 and: [ n1 == aNode ]]) collect: #to.
	toNodes := ( edges
		select: [ :each | 
			| n1 n2 |
			n1 := each from.
			n2 := each to.
			n1 ~= n2 and: [ n2 == aNode] ]) collect: #from.
	allNodes := Set new.
	allNodes
		addAll: fromNodes;
		addAll: toNodes.
	^ allNodes asOrderedCollection