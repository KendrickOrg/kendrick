as yet unclassified
solve
	|timeSeries t countStep eventGenerator |
	timeSeries := OrderedCollection new.
	self initializeResult.
	t := tMin.
	countStep := 0.
	eventGenerator := KEEventGenerator new.
	eventGenerator generateEvents: model.
	[ t < tMax ] whileTrue: [ 
		model addTemporalParameter: #t value: t.
		self doTauLeapIteration.
		t := t + step.
		countStep := countStep + 1.
		self updateResult.
		timeSeries add: t. 
		"check if extinction occurs"
		(model population getNbIndividualsOfCompartment: #I) <= 0 ifTrue: [ 
			self buildData: result with: timeSeries.
			^ countStep
			 ]
	 ].
	self buildData: result with: timeSeries.
	^ countStep
	
	
	