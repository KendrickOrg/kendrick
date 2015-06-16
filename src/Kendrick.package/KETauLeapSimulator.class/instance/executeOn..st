as yet unclassified
executeOn: aModel
	| t |
	super executeOn: aModel.
	t := tMin.
	self updateDataAt: tMin.
	[ t < tMax ]
		whileTrue: [ 
			self doTauLeapIteration: t.
			t := t + step.
			self updateDataAt: t ]