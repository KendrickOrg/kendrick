as yet unclassified
calProb: ind
	|rate rand prob chosen events|
	events := self transitions at: ind currentStatus ifAbsent: [OrderedCollection new].
	"Choose an event for execute on this individual"
	rand := Random new.
	chosen := ((rand next) * (events size)) ceiling.
	(chosen > 0) ifTrue: [ 
		rate := (events at: chosen) key probability value: model.
		prob := 1 - (((step * rate) negated) exp).
		(prob > (rand next)) ifTrue: [ |oldTimes|
			ind nextStatus: ((events at: chosen) key to).
			oldTimes := self transitionExecutions at: (events at: chosen) value.
			self transitionExecutions at: (events at: chosen) value put: (oldTimes + 1)
		].
	]
	