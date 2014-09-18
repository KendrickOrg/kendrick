as yet unclassified
solve
	|timeSeries t previousT countStep|
	timeSeries := OrderedCollection new.
	self initializeResult.
	t := tMin.
	previousT := t.
	countStep := 0.
	[ t < tMax ] whileTrue: [ 
		|deltaT|
		model addTemporalParameter: #t value: t.
		deltaT := self doGillespieIteration.
		countStep := countStep + 1.
		"check if extinction occurs"
		((deltaT = 0) | ((model population getNbIndividualsOfCompartment: #I) <= 0)) 
		ifTrue: [ 		
			self buildData: result with: timeSeries.
			^ countStep ].
		t := t + deltaT.
		t > (previousT + step) ifTrue: [ 
			self updateResult.
			timeSeries add: t.
			previousT := t.
			 ].
		 ].
	"self prepareData: timeSeries."
	self buildData: result with: timeSeries.
	^ countStep