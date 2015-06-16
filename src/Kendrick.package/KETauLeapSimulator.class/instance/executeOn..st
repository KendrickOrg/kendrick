as yet unclassified
executeOn: aModel
	| t |
	self model: aModel.
	t := tMin.
	self updateDataAt: tMin.
	[ t < tMax ]
		whileTrue: [ 
			self doTauLeapIteration: t.
			t := t + step.
			self updateDataAt: t ]