as yet unclassified
Gillespie
	|timeSeries t previousT|
	timeSeries := OrderedCollection new.
	self initializeResult.
	t := tMin.
	previousT := t.
	[ t < tMax ] whileTrue: [ 
		|delta_T|
		model addTemporalParameter: #t value: t.
		delta_T := self doGillespieIterate.
		delta_T = 0 ifTrue: [ ^ self prepareData: timeSeries ].
		t := t + delta_T.
		t > (previousT + step) ifTrue: [ 
			self updateResult.
			timeSeries add: t.
			previousT := t.
			 ].
		 ].
	^ self prepareData: timeSeries