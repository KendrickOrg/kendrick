as yet unclassified
doTauLeapIteration: arg1
	model t: arg1.
	model transitions
		do: [ :arg2 | 
			| tmp1 tmp2 tmp3 |
			(arg2 from at: #status) = #empty
				ifTrue: [ model currentCompartment: arg2 to ]
				ifFalse: [ model currentCompartment: arg2 from ].
			model nextCompartment: arg2 to.
			tmp3 := (arg2 probability value: model) abs.
			tmp1 := tmp3 * (model atCompartment: arg2 from).
			tmp2 := (PoissonGenerator lambda: tmp1 * step) next.
			arg2 executeOn: model times: tmp2 ]