as yet unclassified
executeOn: arg1
	| tmp1 |
	super executeOn: arg1.
	tmp1 := tMin.
	self saveCompartmentsValueAtTime: tMin.
	[ tmp1 < tMax ]
		whileTrue: [ self doTauLeapIteration: tmp1.
			tmp1 := tmp1 + step.
			self saveCompartmentsValueAtTime: tmp1 ]