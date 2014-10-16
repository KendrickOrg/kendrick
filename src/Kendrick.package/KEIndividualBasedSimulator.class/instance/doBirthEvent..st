as yet unclassified
doBirthEvent: population
	|e|
	e := self birthEvents at: (population name) ifAbsent: [ nil ].
	e ifNotNil: [
		|r p rand| 
		r := e evaluateWithModel: model.
		p := 1 - (((r * step) negated) exp).
		rand := Random new.
		(p > (rand next)) ifTrue: [  
			|newInd|
			newInd := KEIndividual new.
			newInd currentStatus: (e toStatus).
			newInd nextStatus: nil.
			population addIndividual: newInd
			]
		]
	