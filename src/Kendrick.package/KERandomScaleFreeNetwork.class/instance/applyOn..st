as yet unclassified
applyOn: graph
	activeNodes := OrderedCollection new.
	network := graph.
	"initialize with m0 degree"
	1 to: (m0 + 1) do: [ :i| 
		activeNodes add: i.
		(i > 1) ifTrue: [ network with: (Array with: 1 with: i) strengthOfConnection: strengthOfConnection ]
		].
	(m0 + 2) to: network nodes size do: [ :i|
		self appendNode: (((network nodes at: i) label)->i)
		]