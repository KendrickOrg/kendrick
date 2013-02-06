accessing
events
	events ifNil: [ self generateEvents ].
	^ events