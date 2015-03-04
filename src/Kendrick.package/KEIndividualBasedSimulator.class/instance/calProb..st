as yet unclassified
calProb: ind
	|rate "rand" prob events|
	events := self transitions at: ind currentStatus ifAbsent: [OrderedCollection new].
	"rand := Random new."
	"Choose an event for execute on this individual"
	1 to: events size do: [ :e|
		model addParameter: #subPopulation value: (events at: e) key subPopulation.
		rate := (events at: e) key probability value: model.
		rate isDictionary ifTrue: [ rate := rate values sum ].
		prob := 1 - (((step * rate) negated) exp).
		(prob > (rand next)) ifTrue: [ |oldTimes|
			ind nextStatus: ((events at: e) key to).
			oldTimes := self transitionNbExecutions at: (events at: e) value.
			^ (self transitionNbExecutions at: (events at: e) value put: (oldTimes + 1))
		].
	 ]
	
	