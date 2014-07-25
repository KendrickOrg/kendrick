as yet unclassified
addNode
	|node x y ind distances prob id|
	node := KENetworkNode new.
	x := (Random new) next.
	y := (Random new) next.
	ind := KEIndividual new.
	ind location: (Array with: x with: y).
	nodes add: node.
	distances := OrderedCollection new.
	1 to: (population indList size) do: [ :i|
		distances add: (ind distanceTo: (population indList at: i))
		 ].
	prob := self calProb: distances.
	id := prob copy sort: [ :a :b| a > b ].
	1 to: numberOfContacts do: [ :k|
		|i j|
		i := prob indexOf: (id at: k).
		j := nodes size.
		self with: (Array with: i with: j) weight: #contact value: 1
		 ].
	^ (Array with: x with: y)