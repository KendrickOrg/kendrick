as yet unclassified
makeNewRoom
	|node x y ind distances prob id|
	node := KENetworkNode new.
	x := (Random new) next * surface.
	y := (Random new) next * surface.
	ind := indList last. 
	ind location: (Array with: x with: y).
	nodes add: node.
	distances := OrderedCollection new.
	1 to: (indList size - 1) do: [ :i|
		distances add: (ind distanceTo: (indList at: i))
		 ].
	prob := self calProb: distances.
	id := prob copy sort: [ :a :b| a > b ].
	1 to: contact do: [ :k|
		|i j|
		i := prob indexOf: (id at: k).
		j := nodes size.
		self with: (Array with: i with: j) weight: #contact value: 1
		 ].
	nbInd := (indList size).
	^ (nodes size)