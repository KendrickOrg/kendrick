as yet unclassified
calProb: ind random: rand
	|rate prob events|
	events := self transitions at: ind currentStatus ifAbsent: [OrderedCollection new].
	"Choose an event for execute on this individual"
	1 to: events size do: [ :e||l|
		"((events at: e) key from = #empty)
		ifTrue: [ model parameters at: #inProcessingCompartment put: ((events at: e) key to) ] 
		ifFalse: [ model parameters at: #inProcessingCompartment put: ((events at: e) key from) ]".
		l := ind currentStatus copy.
		l at: #id put: (ind id).
		model currentCompartment: l.
		rate := ((events at: e) key probability value: model) abs.
		"rate isDictionary ifTrue: [ rate := rate values sum ]."
		prob := 1 - (((step * rate) negated) exp).
		(prob > (rand next)) ifTrue: [ |oldTimes|
			ind nextStatus: ((events at: e) key to).
			oldTimes := self transitionNbExecutions at: (events at: e) value.
			^ (self transitionNbExecutions at: (events at: e) value put: (oldTimes + 1))
		].
	 ]
	
	