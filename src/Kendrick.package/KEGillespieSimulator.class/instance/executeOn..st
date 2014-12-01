as yet unclassified
executeOn: aModel
	|t previousT countStep|
	self model: aModel.
	t := tMin.
	previousT := t.
	countStep := 0.
	self updateDataAt: tMin.
	[ t < tMax ] whileTrue: [ 
		|deltaT|
		deltaT := self doGillespieIteration: t.
		countStep := countStep + 1.
		((deltaT = 0) or: [ (model sizeOf: '{#status: #I}') <= 0 ]) ifTrue:
			[ ^ countStep ].
		t := t + deltaT.
		t > (previousT + step) ifTrue: [ 
			self updateDataAt: t.
			previousT := t.
			 ]
	 ].
	^ countStep