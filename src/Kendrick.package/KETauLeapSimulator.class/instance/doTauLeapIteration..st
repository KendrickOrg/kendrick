as yet unclassified
doTauLeapIteration: t
	model parameters at: #t put: t. 
	model transitions do: [ :tr|
		|rate numPoisson prob|
		"model parameters at: #scope put: tr scope.
		model parameters at: #contactingSource put: (tr from)."
		(tr from = #empty)
		ifTrue: [ model parameters at: #inProcessingCompartment put: (tr to) ] 
		ifFalse: [ model parameters at: #inProcessingCompartment put: (tr from) ].
		prob := (tr probability value: model) abs.
		"prob isDictionary ifTrue: [ prob := prob values sum ]."
		rate := prob * (model atCompartment: tr from).
		numPoisson := (PoissonGenerator lambda: (rate * step)) next.
		tr executeOn: model times: numPoisson   
		 ].
	