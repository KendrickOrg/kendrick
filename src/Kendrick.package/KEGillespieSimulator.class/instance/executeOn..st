public
executeOn: aModel
	| rand1 rand2 t previousT count|
	"ThanhNT"
	count := 1.
	"Endof ThanhNT"
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
			r2 := rand2 next.
			deltaT := self doGillespieIteration: t randoms: (Array with: r1 with: r2).
			(deltaT = 0.0)
				ifTrue: [ ^ self ].
			t := t + deltaT.
			"Only store in the result from step to step"
			t > (previousT + step)
				ifTrue: [ 
					self saveCompartmentsValueAtTime: t.
					previousT := t ].
			count := count + 1.
			"(count > 130000) ifTrue: [ ^t. ]"
				 ]