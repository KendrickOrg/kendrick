as yet unclassified
doGillespieIteration: t
	|rand1 rand2 rates deltaT rateTotal chosen|
	rand1 := Random new.
	rand2 := Random new.
	rates := OrderedCollection new.
	model transitions do: [ :tr|
		rates add: (tr probability 
							value: (model atCompartment: tr from)
							value: (model atCompartment: tr to)
							value: t)
		 ].
	chosen := self random: (rand1 next) select: rates.
	(model transitions at: chosen) executeOn: model times: 1.
	rateTotal := rates sum.
	rateTotal = 0
	ifTrue: [ deltaT := 0 ]
	ifFalse: [ deltaT := ((rand2 next) log) negated / rateTotal ].
	^ deltaT