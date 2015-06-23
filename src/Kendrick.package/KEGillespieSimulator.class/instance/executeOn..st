as yet unclassified
executeOn: aModel
	| rand1 rand2 t previousT |
	super executeOn: aModel.
	t := tMin.
	previousT := t.
	rand1 := Random new.
	rand2 := Random new.
	self saveCompartmentsValueAtTime: tMin.
	
	[ t < tMax ]
		whileTrue: [ 
			| deltaT r1 r2 |
			r1 := rand1 next.
			r2 := rand1 next.
			deltaT := self doGillespieIteration: t randoms: (Array with: r1 with: r2).
			Transcript show: (aModel population compartments) values; cr.
			deltaT = 0.0
				ifTrue: [ ^ self ].
			t := t + deltaT.
			"Only store in the result from step to step"
			t > (previousT + step)
				ifTrue: [ 
					self saveCompartmentsValueAtTime: t.
					previousT := t ] ]