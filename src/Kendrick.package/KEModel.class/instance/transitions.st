accessing
transitions
	((transitions size = 0) and: [ equations size > 0 ]) ifTrue: [ 
		|events|
		events := (KEEventGenerator new) generateEvents: self.
		 ].
	^ transitions