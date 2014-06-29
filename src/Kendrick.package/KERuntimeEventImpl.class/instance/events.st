as yet unclassified
events
	events ifNil: [ 
		events := self simulatorBuilder buildEvents: (self generateEvents). ].
	^ events
	
	
	