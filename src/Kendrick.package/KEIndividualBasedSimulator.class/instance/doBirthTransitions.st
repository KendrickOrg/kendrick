as yet unclassified
doBirthTransitions
	"|rand|
	rand := Random new."
	self birthTransitions do: [ :e|
		|r p| 
		"model parameters at: #scope put: e key scope.
		model parameters at: #contactingSource put: (e key from)."
		"(e key from = #empty)
		ifTrue: [ model parameters at: #inProcessingCompartment put: (e key to) ] 
		ifFalse: [ model parameters at: #inProcessingCompartment put: (e key from) ]."
		model parameters at: #inProcessingCompartment put: (e key to).
		r := (e key probability value: model) abs.
		"r isDictionary ifTrue: [ r := r values sum ]."
		"p := 1 - (((r * step) negated) exp).
		(p > (rand next)) ifTrue: [  
			|newInd oldTimes|
			newInd := KEIndividual new.
			newInd currentStatus: e key to.
			newInd updateAttributes: e key to.
			newInd nextStatus: nil.
			model population addIndividual: newInd.
			oldTimes := self transitionNbExecutions at: e value.
			self transitionNbExecutions at: e value put: (oldTimes + 1)
			]"
		r := r * (model atCompartment: e key from).
		p := (PoissonGenerator lambda: (r * step)) next.
		1 to: p do: [ :i||newInd|
			newInd := KEIndividual new.
			newInd currentStatus: e key to.
			newInd updateAttributes: e key to.
			newInd nextStatus: nil.
			model population addIndividual: newInd.
			 ].
		self transitionNbExecutions at: e value put: p
		]
	