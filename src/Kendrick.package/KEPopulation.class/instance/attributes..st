accessing
attributes: input
	input isArray 
	ifTrue: [ attributes := Dictionary newFrom: input ] ifFalse: [ attributes := STON fromString: input ]
	