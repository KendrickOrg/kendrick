as yet unclassified
solve
	|timeSeries t countStep|
	timeSeries := OrderedCollection new.
	self initializeResult.
	self initializeEvents.
	t := tMin.
	countStep := 0.
	[ t < tMax ] whileTrue: [ 
		model addTemporalParameter: #t value: t.
		self doTauLeapIteration.
		t := t + step.
		countStep := countStep + 1.
		self updateResult.
		timeSeries add: t. 
		"check if extinction occurs"
		(model population nbOfIndividualsOf: #I) <= 0 ifTrue: [ 
			self buildData: result with: timeSeries.
			^ countStep
			 ]
	 ].
	self buildData: result with: timeSeries.
	^ countStep
	
	
	