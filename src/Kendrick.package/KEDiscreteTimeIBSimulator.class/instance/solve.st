as yet unclassified
solve
	|timeSeries t countStep|
	timeSeries := OrderedCollection new.
	self initializeResult.
	t := tMin.
	countStep := 0.
	[ t < tMax ] whileTrue: [ 
		model addTemporalParameter: #t value: t. 
		self doIteration.
		t := t + step.
		countStep := countStep + 1.
		self updateResult.
		timeSeries add: t.
	 ].
	self prepareData: timeSeries.
	^ countStep