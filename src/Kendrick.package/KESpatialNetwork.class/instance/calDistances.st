as yet unclassified
calDistances
	|distances|
	self edges: #all.
	distances := OrderedCollection new.
	edges do: [ :each|
		|x y|
		x := population individuals at: (#first value: each).
		y := population individuals at: (#second value: each).
		distances add: (x distanceTo: y)
		 ].
	^ distances
	
