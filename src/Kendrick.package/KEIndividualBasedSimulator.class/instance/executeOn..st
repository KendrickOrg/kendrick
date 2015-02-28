as yet unclassified
executeOn: aModel
	|t countStep rand1 rand2|
	self model: aModel.
	t := tMin.
	countStep := 0.
	rand1 := Random new.
	rand2 := Random new.
	self updateDataAt: tMin.
	[ t < tMax ] whileTrue: [ 
		self doIBMIteration: t.
		self updateIndividuals.
		t := t + step.
		self updateDataAt: t.
		countStep := countStep + 1.
		"(model sizeOf: '{#status: #I}') <= 0 ifTrue: [ ^ countStep ]"
	 ].
	^ countStep