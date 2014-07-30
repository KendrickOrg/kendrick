as yet unclassified
calProb2: ind
	"This function is different from the calProb: in calProb: we will choose randomly an event for an individual for executed. In calProb2, all possible events of an individual will be executed"
	|events moveEvents rand|
	rand := Random new.
	events := self eventList at: (ind currentStatus) ifAbsent: [ OrderedCollection new ].
	1 to: (events size) do: [ :i|
		|e rate prob|
		e := events at: i.
		rate := ((self eventRates at: (model currentPopulationID)) at: (ind currentStatus)) at: i.
		rate = -1 ifTrue: [ 
			rate := e evaluateWithModel: model.
			 ].
		prob := 1 - (((step * rate) negated) exp).
		(prob > (rand next)) ifTrue: [ 
			ind nextStatus: (e toStatus).
			 ]
	 ].
	self movementEventList ifNotNil: [ 
		moveEvents := self movementEventList at: (ind populationID) ifAbsent: [ OrderedCollection new ].
		1 to: (moveEvents size) do: [ :i|
			|r prob e|
			e := moveEvents at: i.
			r := (self moveRates at: (ind populationID)) at: i.
			prob := 1 - (((step * r) negated) exp).
			(prob > (rand next)) ifTrue: [ 
				ind attributes at: #moveTo put: (e toStatus).
				 ]
			 ]
		 ]
	