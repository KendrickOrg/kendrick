as yet unclassified
doBirthTransitions
	self birthTransitions do: [ :e|
		|r p rand| 
		r := e key probability value: model.
		p := 1 - (((r * step) negated) exp).
		rand := Random new.
		(p > (rand next)) ifTrue: [  
			|newInd oldTimes|
			newInd := KEIndividual new.
			newInd currentStatus: e key to.
			newInd updateAttributes: e key to.
			newInd nextStatus: nil.
			model population addIndividual: newInd.
			oldTimes := self transitionExecutions at: e value.
			self transitionExecutions at: e value put: (oldTimes + 1)
			]
		]
	