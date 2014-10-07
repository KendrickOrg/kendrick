as yet unclassified
initNetwork
	self initPositions.
	1 to: (self nodes size) do: [ :i|
		self addEdge: i
		 ].
	self initContacts