as yet unclassified
evaluateWithModel: model
	|x|
	x := model atParameter: symbol.
	x = #sizeOfPopulation ifTrue: [ 
		|s|
		s := model atParameter: #subPopulation.
		s ifNotNil: [ ^ model sizeOfPopulation: s associations ].
		^ model sizeOfPopulation: #population
		 ].
	x ifNil: [ ^ model atCompartment: (Dictionary newFrom: {(#status->symbol)}) ].
	x isBlock ifTrue: [ ^ x value: model ].
	x isNumber ifTrue: [ ^ x ].
	x isExpression ifTrue: [ ^ x evaluateWithModel: model ].
	^ x 