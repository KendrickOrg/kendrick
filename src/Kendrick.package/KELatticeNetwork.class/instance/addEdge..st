as yet unclassified
addEdge: currentNode
	"Add the current node to the grid"
	|j|
	j := currentNode - (self gridWidth).
	(j > 0) ifTrue: [ self with: (Array with: currentNode with: j) weight: #contact value: 1 ].
	((currentNode \\ (self gridWidth)) ~= 1)
	ifTrue: [ 
		j := currentNode - 1.
		self with: (Array with: currentNode with: j) weight: #contact value: 1
		 ]