as yet unclassified
executeMovementEvent: events arg: arguments
	|indEvents eChosen ind rand rate event|
	ind := arguments at: #individual.
	rand := Random new.
	rate := 0.
	event := nil.
	indEvents := events at: (ind pid) ifAbsent: [ OrderedCollection new ].
	eChosen := ((rand next) * (indEvents size)) ceiling.
	(eChosen > 0) ifTrue: [ 
		event := indEvents at: eChosen.
		rate := ((model population at: (ind pid)) rates at: (ind pid)) at: eChosen.
		^ (Array with: event with: rate)
		 ].
	^ nil
	