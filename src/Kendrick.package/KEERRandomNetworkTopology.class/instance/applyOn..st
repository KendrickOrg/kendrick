instance creation
applyOn: graph
	graph nodes do: [ :node| self appendNode: (node label)->graph]
	