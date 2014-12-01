accessing
transitions
	((equations size > 0) and: [ transitions size = 0 ]) ifTrue: [ 
		self equationsToTransitions.
		 ].
	^ transitions