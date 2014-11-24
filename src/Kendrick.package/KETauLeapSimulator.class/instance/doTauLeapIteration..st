as yet unclassified
doTauLeapIteration: t
	model transitions do: [ :tr|
		|rate numPoisson|
		rate := (tr probability 
							value: (model atCompartment: tr from)
							value: (model atCompartment: tr to)
							value: t).
		numPoisson := (PoissonGenerator lambda: (rate * step)) next.
		tr executeOn: model times: numPoisson   
		 ].
	