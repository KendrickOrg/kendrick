as yet unclassified
edges: edgeCollection
	edgeCollection = #all
	ifTrue: [ 
		1 to: nodes size do: [ :id|
			|rest|
			rest := (id + 1) to: (nodes size).
			rest do: [ :id2|
				|edge|
				edge := Array with: id with: id2.
				edges add: edge.
				 ]
			 ]
		 ]
	ifFalse: [ 
		edgeCollection do: [ :each|
			each at: 1 put: (nodeNames indexOf: (each at: 1)).
			each at: 2 put: (nodeNames indexOf: (each at: 2)).
			edges add: each.			
			 ]
		 ]