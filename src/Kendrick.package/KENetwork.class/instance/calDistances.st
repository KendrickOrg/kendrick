as yet unclassified
calDistances
	|distances|
	self edges: #all.
	distances := OrderedCollection new.
	edges do: [ :each|
		|x y|
		x := population indList at: (#first value: each).
		y := population indList at: (#second value: each).
		distances add: (x distanceTo: y)
		 ].
	^ distances
	
