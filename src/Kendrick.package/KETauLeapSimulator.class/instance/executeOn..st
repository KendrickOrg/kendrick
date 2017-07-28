as yet unclassified
executeOn: aModel
	| t |
	super executeOn: aModel.
	t := tMin.
	self saveCompartmentsValueAtTime: tMin.
	[ t < tMax ]
		whileTrue: [ 
			self doTauLeapIteration: t.
			t := t + step.
			self saveCompartmentsValueAtTime: t ]