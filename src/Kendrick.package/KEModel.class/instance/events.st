accessing
events
	events isNil
		ifTrue: [ self generateEvents ].
	^ events