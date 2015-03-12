as yet unclassified
executeOn: aModel
	|t countStep rand|
	self model: aModel.
	t := tMin.
	countStep := 0.
	self updateDataAt: tMin.
	rand := Random new.
	[ t < tMax ] whileTrue: [ 
		self doIBMIteration: t random: rand.
		self updateIndividuals.
		t := t + step.
		self updateDataAt: t.
		countStep := countStep + 1
	 ].
	^ countStep