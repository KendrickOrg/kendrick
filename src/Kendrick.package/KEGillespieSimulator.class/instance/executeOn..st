as yet unclassified
executeOn: aModel
	|rand1 rand2 t previousT countStep|
	self model: aModel.
	t := tMin.
	previousT := t.
	countStep := 0.
	rand1 := Random new.
	rand2 := Random new.
	self updateDataAt: tMin.
	[ t < tMax ] whileTrue: [ 
		|deltaT r1 r2|
		r1 := rand1 next.
		r2 := rand1 next.
		deltaT := self doGillespieIteration: t randoms: (Array with: r1 with: r2).
		countStep := countStep + 1.
		deltaT = 0.0 ifTrue: [ ^ countStep ].
		"((deltaT = 0) or: [ (model sizeOf: '{#status: #I}') <= 0 ]) ifTrue:
			[ ^ countStep ]."
		t := t + (deltaT). 
		t > (previousT + step) ifTrue: [ 
			self updateDataAt: t.
			previousT := t.
		 ]
	 ].
	^ countStep