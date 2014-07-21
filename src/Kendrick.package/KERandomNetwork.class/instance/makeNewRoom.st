as yet unclassified
makeNewRoom
	|node rand x y|
	"Make a new node and add this node to the network"
	node := KENetworkNode new.
	nodes add: node.
	rand := Random new.
	x := rand next * surface.
	y := rand next * surface.
	1 to: contact do: [ :k|
		|i j|
		i := (nodes size).
		j := ((rand next) * nbInd) ceiling.
		self with: (Array with: i with: j) weight: #contact value: 1
		].
	^ (Array with: x with: y)