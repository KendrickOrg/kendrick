accessing
with: adjacentNodeID weight: weight
	"This function will add a new adjacent node into adjacentNodes list and the weight of the link between these two nodes: self and the new adjacent node"
	adjacentNodes addLast: adjacentNodeID.
	"If has weightFunction, so calculate weight following this function"
	self hasWeightFunction ifTrue: [ weights addLast: (weightFunction value: weight) ]
	ifFalse: [ weights addLast: weight ]