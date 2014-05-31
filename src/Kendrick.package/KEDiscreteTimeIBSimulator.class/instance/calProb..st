as yet unclassified
calProb: ind
	|events moveEvents rand|
	rand := Random new.
	events := self eventList at: (ind currentStatus).
	1 to: (events size) do: [ :i|
		|e rate prob|
		e := events at: i.
		rate := (self eventRates at: (ind currentStatus)) at: i.
		rate = -1 
		ifTrue: [ 
			rate := (e evaluateIntraPopInteractionWithModel: model) + (e evaluateInterPopInteractionWithModel: model) ].
		prob := 1 - (((step * rate) negated) exp).
		(prob > (rand next)) ifTrue: [ 
			ind nextStatus: (e toStatus).
			 ]
	 ].
	moveEvents := self movementEventList at: (ind pid).
	1 to: (moveEvents size) do: [ :i|
		|r prob e|
		e := moveEvents at: i.
		r := (self eventRates at: (ind pid)) at: i.
		prob := 1 - (((step * r) negated) exp).
		(prob > (rand next)) ifTrue: [ 
			ind attributes at: #moveTo put: (e toStatus).
			 ]
		 ]