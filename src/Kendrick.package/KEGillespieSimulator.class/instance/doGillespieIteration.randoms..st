as yet unclassified
doGillespieIteration: t randoms: rands
	|rates deltaT  chosen|
	rates := OrderedCollection new.
	model addParameter: #t value: t.
	model transitions do: [ :tr| 
		|prob|
		model addParameter: #subPopulation value: tr subPopulation.
		prob := (tr probability value: model).
		prob isDictionary ifTrue: [ prob := prob values sum ].
		rates add: (prob * (model atCompartment: tr from)) 
		].
	deltaT := (((rands second) log) negated) / (rates sum).
	chosen := self random: (rands first) select: rates.
	(model transitions at: chosen) executeOn: model times: 1.
	^ deltaT