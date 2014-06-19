as yet unclassified
calDistances
	|distances|
	self initLocation.
	self edges: #all.
	distances := OrderedCollection new.
	edges do: [ :each|
		|x y|
		x := indList at: (#first value: each).
		y := indList at: (#second value: each).
		distances add: (x distanceTo: y)
		 ].
	^ distances
	
