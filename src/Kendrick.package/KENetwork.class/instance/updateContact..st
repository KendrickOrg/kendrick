as yet unclassified
updateContact: ind
	|index node|
	index := ind attributes at: #id.
	node := nodes at: index.
	node adjacentNodes do: [ :i|
		node at: ((indList at: i) currentStatus) add: 1
		 ]