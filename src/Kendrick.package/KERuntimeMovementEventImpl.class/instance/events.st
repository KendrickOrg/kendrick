as yet unclassified
events
	events ifNil: [ 
		events := self simulatorBuilder buildMovementEvents: (self generateEvents). ].
	^ events
