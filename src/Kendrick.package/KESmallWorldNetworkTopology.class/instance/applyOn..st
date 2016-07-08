accessing
applyOn: graph
	activeNodes := OrderedCollection new.
	"1 to: graph nodes size do: [ :i|
		self appendNode: (((graph nodes at: i) label)->i)
		]."
	1 to: graph nodes size do: [ :i| self appendNode: i->graph ]
	"graph nodes do: [ :node| self appendNode: (node label)->graph]"