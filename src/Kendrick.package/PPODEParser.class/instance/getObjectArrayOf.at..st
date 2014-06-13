grammar
getObjectArrayOf: nodes at: id
	|collection|
	collection := OrderedCollection new.
	nodes do: [ :each|
		collection addLast: (each at: id) parsedValue
		 ].
	^ collection