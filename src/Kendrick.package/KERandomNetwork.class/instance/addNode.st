as yet unclassified
addNode
	|node rand x y|
	"Make a new node and add this node to the network"
	node := KENetworkNode new.
	nodes add: node.
	rand := Random new.
	x := rand next.
	y := rand next.
	1 to: numberOfContacts do: [ :k|
		|i j|
		i := (nodes size).
		j := i.
		[ j = i ] whileTrue: [ j := ((rand next) * (self nodes size)) ceiling. ].
		self with: (Array with: i with: j) weight: #contact value: 1
		].
	^ (Array with: x with: y)