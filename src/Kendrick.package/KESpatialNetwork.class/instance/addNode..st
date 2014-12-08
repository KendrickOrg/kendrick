as yet unclassified
addNode: ind
	|node x y distances prob id|
	node := KENetworkNode new label: (ind currentStatus at: #status).
	x := (Random new) next.
	y := (Random new) next.
	ind attributes at: #position put: (Array with: x with: y).
	nodes add: node.
	distances := OrderedCollection new.
	1 to: (population individuals size - 1) do: [ :i|
		distances add: (ind distanceTo: (population individuals at: i))
		 ].
	prob := self calProb: distances.
	id := prob copy sort: [ :a :b| a > b ].
	1 to: numberOfContacts do: [ :k|
		|i j|
		i := prob indexOf: (id at: k).
		j := nodes size.
		self with: (Array with: i with: j) weight: #contact value: 1
		 ].
	