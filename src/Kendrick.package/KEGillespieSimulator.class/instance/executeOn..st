as yet unclassified
executeOn: aModel
	| rand1 rand2 t previousT |
	self model: aModel.
	t := tMin.
	previousT := t.
	rand1 := Random new.
	rand2 := Random new.
	self updateDataAt: tMin.
	[ t < tMax ]
		whileTrue: [ 
			| deltaT r1 r2 |
			r1 := rand1 next.
			r2 := rand1 next.
			deltaT := self doGillespieIteration: t randoms: (Array with: r1 with: r2).
			deltaT = 0.0
				ifTrue: [ ^ self ].
			t := t + deltaT.
			t > (previousT + step)
				ifTrue: [ 
					self updateDataAt: t.
					previousT := t ] ]