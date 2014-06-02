as yet unclassified
makeNewRoom
	|node i j x y loc|
	node := KENetworkNode new.
	nodes add: node.
	"find location of new individual"
	i := (nodes size).
	j := (nodes size) - sqrtNbInd.
	loc := (indList at: j) location.
	x := (#first value: loc).
	y := (#second value: loc) + (1.0/sqrtNbInd).
	indList last location: (Array with: x with: y).
	self with: (Array with: i with: j) weight: #contact value: 1.
	(i\\sqrtNbInd) ~= 1 
	ifTrue: [ 
		j := i - 1.
		self with: (Array with: i with: j) weight: #contact value: 1
		 ].
	nbInd := (indList size).
	^ (nodes size)