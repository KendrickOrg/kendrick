as yet unclassified
doGillespieIteration: t randoms: rands
	|rates deltaT  chosen|
	rates := OrderedCollection new.
	model parameters at: #t put: t.
	model transitions do: [ :tr| 
		|prob|
		"model parameters at: #scope put: tr scope.
		model parameters at: #contactingSource put: (tr from)."
		(tr from = #empty)
		ifTrue: [ model parameters at: #inProcessingCompartment put: (tr to) ] 
		ifFalse: [ model parameters at: #inProcessingCompartment put: (tr from) ].
		prob := (tr probability value: model) abs.
		"prob isDictionary ifTrue: [ prob := prob values sum ]."
		rates add: (prob * (model atCompartment: tr from)) 
		].
	(rates sum) = 0 ifTrue: [ ^ 0.0 ].
	deltaT := (((rands second) ln) negated) / (rates sum).
	chosen := self random: (rands first) select: rates.
	(model transitions at: chosen) executeOn: model times: 1.
	^ deltaT