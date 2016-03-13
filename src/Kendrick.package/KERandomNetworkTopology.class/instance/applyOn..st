instance creation
applyOn: graph
	activeNodes := OrderedCollection new.
	network := graph.
	1 to: network nodes size do: [ :i|
		self appendNode: (((network nodes at: i) label)->i)
		]
	