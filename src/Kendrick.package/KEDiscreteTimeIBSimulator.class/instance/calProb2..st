as yet unclassified
calProb2: ind
	|events moveEvents rand|
	rand := Random new.
	events := self eventList at: (ind currentStatus) ifAbsent: [ OrderedCollection new ].
	1 to: (events size) do: [ :i|
		|e rate prob|
		e := events at: i.
		rate := ((self eventRates at: (model getPID)) at: (ind currentStatus)) at: i.
		rate = -1 
		ifTrue: [ 
			"rate := (e evaluateIntraPopInteractionWithModel: model) + (e evaluateInterPopInteractionWithModel: model)."
			rate := e evaluateWithModel: model.
			 ].
		prob := 1 - (((step * rate) negated) exp).
		(prob > (rand next)) ifTrue: [ 
			ind nextStatus: (e toStatus).
			 ]
	 ].
	self movementEventList ifNotNil: [ 
		moveEvents := self movementEventList at: (ind pid) ifAbsent: [ OrderedCollection new ].
		1 to: (moveEvents size) do: [ :i|
			|r prob e|
			e := moveEvents at: i.
			r := (self moveRates at: (ind pid)) at: i.
			prob := 1 - (((step * r) negated) exp).
			(prob > (rand next)) ifTrue: [ 
				ind attributes at: #moveTo put: (e toStatus).
				 ]
			 ]
		 ]
	