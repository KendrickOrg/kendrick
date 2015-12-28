as yet unclassified
doTauLeapIteration: t
	model t: t. 
	model transitions do: [ :tr|
		|rate numPoisson prob|
		"model parameters at: #scope put: tr scope.
		model parameters at: #contactingSource put: (tr from)."
		(tr from = #empty)
		ifTrue: [ model currentCompartment: (tr to) ] 
		ifFalse: [ model currentCompartment: (tr from) ].
		prob := (tr probability value: model) abs.
		"prob isDictionary ifTrue: [ prob := prob values sum ]."
		rate := prob * (model atCompartment: tr from).
		numPoisson := (PoissonGenerator lambda: (rate * step)) next.
		tr executeOn: model times: numPoisson   
		 ].
	