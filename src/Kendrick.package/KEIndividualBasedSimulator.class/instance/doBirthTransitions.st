as yet unclassified
doBirthTransitions
	birthTransitions do: [ :e|
		|r p|
		model currentCompartment: (e key to).
		r := (e key probability value: model) abs.
		r := r * (model atCompartment: e key from).
		p := (PoissonGenerator lambda: (r * step)) next.
		1 to: p do: [ :i||newInd|
			newInd := KEIndividual new.
			newInd updateAttributes: e key to.
			model population addIndividual: newInd.
			 ].
		self transitionNbExecutions at: e value put: p
		]
	