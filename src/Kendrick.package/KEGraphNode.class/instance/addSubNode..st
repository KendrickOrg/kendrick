accessing
addSubNode: aNode
	"This function will add a new node to sub-node list"
	aNode id: (subNodes size + 1).
	aNode parent: self.
	subNodes addLast: aNode