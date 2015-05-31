as yet unclassified
calDistances
	|distances|
	edges := OrderedCollection new.
	1 to: nodes size do: [ :i|
		|rest|
		rest := (i + 1) to: (nodes size).
		rest do: [ :j||edge|
			edge := Array with: i with: j.
			edges add: edge ]
		 ].
	distances := OrderedCollection new.
	edges do: [ :each|
		|x y|
		x := population individuals at: (#first value: each).
		y := population individuals at: (#second value: each).
		distances add: (x distanceTo: y)
		 ].
	^ distances
	
