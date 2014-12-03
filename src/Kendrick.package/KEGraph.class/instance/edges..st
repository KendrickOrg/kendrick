accessing
edges: edgeCollection
	edges := OrderedCollection new.
	edgeCollection = #all
	ifTrue: [ 
		1 to: nodes keys size do: [ :id|
			|rest|
			rest := (id + 1) to: (nodes keys size).
			rest do: [ :id2|
				|edge|
				edge := Array with: (nodes keys at: id) with: (nodes keys at: id2).
				edges add: edge.
				 ]
			 ]
		 ]
	ifFalse: [ 
		edges addAll: edgeCollection
		 ]