as yet unclassified
nodes: aCollection
	aCollection do: [ :each|
		|node|
		node := KENode new.
		nodes add: node
		 ].
	nodeNames := aCollection