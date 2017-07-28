as yet unclassified
contactsOf: arguments
	"{model. attrbute1->value1. attribute2->value2}"
	|model rs|
	model := arguments first.
	rs := 0.
	self adjacentNodes do: [ :node||attributes|
		attributes := Dictionary new.
		(arguments size > 1) ifTrue: [ 
			2 to: (arguments size) do: [ :i| attributes at: (arguments at: i) key put: (arguments at: i) value ] ].
		attributes at: #node put: node.  
		rs := rs + (self sumAll: (model atCompartment: attributes))
	].
 	^ rs