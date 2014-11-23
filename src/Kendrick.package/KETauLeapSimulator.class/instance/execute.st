as yet unclassified
execute
	|t countStep|
	t := tMin.
	countStep := 0.
	self updateDataAt: tMin.
	t := t + step.
	[ t < tMax ] whileTrue: [ 
		self doTauLeapIteration: t.
		self updateDataAt: t.
		countStep := countStep + 1.
		(model sizeOf: '{#status: #I}') <= 0 ifTrue: [ ^ countStep ].
		t := t + step.
	 ].
	^ countStep