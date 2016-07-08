instance creation
applyOn: graph
	"initialize with m0 degree"
	activeNodes add: (graph nodes first) label.
	2 to: (m0 + 1) do: [ :i| 
		activeNodes add: (graph nodes at: i) label.
		graph edgesFrom: (graph nodes first) label toAll: (Array with: (graph nodes at: i) label) 
	].
	(m0 + 2) to: graph nodes size do: [ :i|
		self appendNode: (graph nodes at: i) label->graph
		]