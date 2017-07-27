public
executeOn: arg1
	| tmp1 tmp2 |
	super executeOn: arg1.
	tmp1 := tMin.
	self saveCompartmentsValueAtTime: tMin.
	tmp2 := Random new.
	[ tmp1 < tMax ]
		whileTrue: [ | tmp4 |
			tmp4 := self.
			tmp4
				doIBMIteration: tmp1 random: tmp2;
				updateIndividuals.
			tmp1 := tmp1 + step.
			self saveCompartmentsValueAtTime: tmp1 ]