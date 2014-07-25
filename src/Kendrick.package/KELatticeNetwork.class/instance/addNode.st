as yet unclassified
addNode
	|node i x y sqrtNbInd|
	sqrtNbInd := self gridWidth.
	node := KENetworkNode new.
	nodes add: node.
	"find location of new individual"
	i := (self nodes size).
	x := i\\sqrtNbInd.
	y := i//sqrtNbInd + 1.
	x = 0 ifTrue: [ x := sqrtNbInd. y := i //sqrtNbInd ].
	self addEdge: i.
	^ (Array with: x with: y)
	