as yet unclassified
updateContact: ind
	"This function is used in the newInd:in that create a new individual and add it into the network, so for the new individual added, it should update the number of contact for others"
	|index node|
	index := ind id.
	node := nodes at: index.
	node adjacentNodes do: [ :i|
		node at: ((population indList at: i) currentStatus) add: 1
		 ]