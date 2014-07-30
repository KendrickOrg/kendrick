as yet unclassified
executeEvent: events arg: arguments
	|indEvents eChosen ind rand rate event|
	ind := arguments at: #individual.
	rand := Random new.
	rate := 0.
	event := nil.
	indEvents := events at: (ind currentStatus) ifAbsent: [ OrderedCollection new ].
	eChosen := ((rand next) * (indEvents size)) ceiling.
	(eChosen > 0) ifTrue: [ 
		event := indEvents at: eChosen.
		rate := ((model population at: (ind populationID)) rates at: (ind currentStatus)) at: eChosen.
		rate = -1 ifTrue: [ rate := event evaluateWithModel: model ].
		^ (Array with: event with: rate)
		 ].
	^ nil