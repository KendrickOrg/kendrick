as yet unclassified
doBirthTransitions
	"|rand|
	rand := Random new."
	self birthTransitions do: [ :e|
		|r p| 
		model addParameter: #subPopulation value: e key subPopulation.
		r := e key probability value: model.
		r isDictionary ifTrue: [ r := r values sum ].
		p := 1 - (((r * step) negated) exp).
		(p > (rand next)) ifTrue: [  
			|newInd oldTimes|
			newInd := KEIndividual new.
			newInd currentStatus: e key to.
			newInd updateAttributes: e key to.
			newInd nextStatus: nil.
			model population addIndividual: newInd.
			oldTimes := self transitionNbExecutions at: e value.
			self transitionNbExecutions at: e value put: (oldTimes + 1)
			]
		]
	