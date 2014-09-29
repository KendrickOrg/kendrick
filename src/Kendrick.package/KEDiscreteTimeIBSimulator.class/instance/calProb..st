as yet unclassified
calProb: ind
	|rate rand prob chosen events|
	events := (model population at: (ind populationID)) events at: (ind currentStatus) ifAbsentPut: (OrderedCollection new).
	"Choose an event for execute on this individual"
	rand := Random new.
	chosen := ((rand next) * (events size)) ceiling.
	(chosen > 0) ifTrue: [ 
		rate := (events at: chosen) evaluateWithModel: model.
		prob := 1 - (((step * rate) negated) exp).
		(prob > (rand next)) ifTrue: [ 
			ind nextStatus: ((events at: chosen) toStatus)
		].
	]
	