as yet unclassified
addNode: ind
	|node i x y sqrtNbInd|
	sqrtNbInd := self gridWidth.
	node := KENetworkNode new label: (ind currentStatus at: #status).
	nodes add: node.
	"find location of new individual"
	i := (self nodes size).
	x := i\\sqrtNbInd.
	y := i//sqrtNbInd + 1.
	x = 0 ifTrue: [ x := sqrtNbInd. y := i //sqrtNbInd ].
	self addEdge: i.
	ind attributes at: #position put: (Array with: x with: y)
	