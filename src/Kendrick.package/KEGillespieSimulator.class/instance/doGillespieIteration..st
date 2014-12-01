as yet unclassified
doGillespieIteration: t
	|rand1 rand2 rates deltaT rateTotal chosen|
	rand1 := Random new.
	rand2 := Random new.
	rates := OrderedCollection new.
	model addParameter: #t value: t.
	model transitions do: [ :tr| 
		|prob|
		prob := (tr probability value: model).
		prob isDictionary ifTrue: [ prob := prob values sum ].
		rates add: (prob * (model atCompartment: tr from)) ].
	chosen := self random: (rand1 next) select: rates.
	(model transitions at: chosen) executeOn: model times: 1.
	rateTotal := rates sum.
	rateTotal = 0
	ifTrue: [ deltaT := 0 ]
	ifFalse: [ deltaT := ((rand2 next) log) negated / rateTotal ].
	^ deltaT