as yet unclassified
contactsOf: arguments
	"{model. attrbute1->value1. attribute2->value2}"
	|model rs|
	model := arguments first.
	rs := 0.
	self adjacentNodes do: [ :node||attributes|
		attributes := Dictionary new.
		attributes at: #network put: (model currentCompartment at: #network).
		(arguments size > 1) ifTrue: [ 
			2 to: (arguments size) do: [ :e| attributes at: e key put: e value ] ].
		attributes at: #node put:node.  
		rs := rs + (self sumAll: (model atCompartment: attributes))
	].
 	^ rs