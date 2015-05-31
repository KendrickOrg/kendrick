as yet unclassified
doTauLeapIteration: t
	model addParameter: #t value: t. 
	model transitions do: [ :tr|
		|rate numPoisson prob|
		model addParameter: #subPopulation value: tr subPopulation.
		prob := tr probability value: model.
		prob isDictionary ifTrue: [ prob := prob values sum ].
		rate := prob * (model atCompartment: tr from).
		numPoisson := (PoissonGenerator lambda: (rate * step)) next.
		tr executeOn: model times: numPoisson   
		 ].
	