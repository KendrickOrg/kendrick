accessing
edges: edgeCollection
	edges := OrderedCollection new.
	edgeCollection = #(#all)
	ifTrue: [ 
		1 to: nodes size do: [ :id|
			|rest|
			rest := (id + 1) to: (nodes size).
			rest do: [ :id2|
				|edge|
				edge := Array with: (nodes at: id) label with: (nodes at: id2) label.
				edges add: edge.
				 ]
			 ]
		 ]
	ifFalse: [ 
		edges addAll: edgeCollection
		 ]