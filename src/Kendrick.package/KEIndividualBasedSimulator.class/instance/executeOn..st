as yet unclassified
executeOn: aModel
	|t countStep|
	self model: aModel.
	t := tMin.
	countStep := 0.
	self updateDataAt: tMin.
	[ t < tMax ] whileTrue: [ 
		self doIBMIteration: t.
		self updateIndividuals.
		t := t + step.
		self updateDataAt: t.
		countStep := countStep + 1
	 ].
	^ countStep