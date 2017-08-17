as yet unclassified
calProb: ind random: rand
	|rate prob events|
	events := self transitions at: ind currentStatus ifAbsent: [OrderedCollection new].
	"Choose an event for execute on this individual"
	1 to: events size do: [ :e||l r|
		l := ind currentStatus copy.
		model currentCompartment: l.
		model nextCompartment: ((events at: e) key to).
		rate := ((events at: e) key probability value: model) abs.
		(rate isNumber) ifTrue: [ r := rate ].
		(rate isArray) ifTrue: [ r := self project: rate into: l ].
		prob := 1 - (((step * r) negated) exp).
		(prob > (rand next)) ifTrue: [ |oldTimes|
			ind nextStatus: ((events at: e) key to).
			oldTimes := self transitionNbExecutions at: (events at: e) value.
			^ (self transitionNbExecutions at: (events at: e) value put: (oldTimes + 1))
		].
	 ]
	
	