as yet unclassified
executeOn: aModel
	| t rand |
	self model: aModel.
	t := tMin.
	self updateDataAt: tMin.
	rand := Random new.
	[ t < tMax ]
		whileTrue: [ 
			self doIBMIteration: t random: rand.
			self updateIndividuals.
			t := t + step.
			self updateDataAt: t ]