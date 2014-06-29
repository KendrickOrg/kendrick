as yet unclassified
calProb: ind
	|rates rand prob chosen|
	rates := OrderedCollection new.
	self rtImpls do: [ :impl| |rs|
		impl arguments at: #individual put: ind.
		rs := impl performEvent.
		rs ifNotNil: [ rates add: rs ]
		 ].
	rand := Random new.
	chosen := ((rand next) * (rates size)) ceiling.
	(chosen > 0) ifTrue: [ 
		prob := 1 - (((step * ((rates at: chosen) at: 2)) negated) exp).
		(prob > (rand next)) ifTrue: [ 
			ind nextStatus: ((rates at: chosen) at: 1) toStatus
		].
	]
	