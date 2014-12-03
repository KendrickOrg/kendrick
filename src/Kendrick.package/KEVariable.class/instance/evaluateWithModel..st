as yet unclassified
evaluateWithModel: model
	|x|
	x := model atParameter: symbol.
	x ifNil: [ "|subPop tmp|
		subPop := model parameters at: #subPopulation ifAbsent: [nil].
		subPop ifNil: [ ^ model atCompartment: (Dictionary newFrom: {(#status->symbol)}) ].
		tmp := subPop copy. 
		x := model atParameter: (Dictionary newFrom: {(tmp->symbol)}).
		x ifNil: [ "^ model atCompartment: (Dictionary newFrom: {(#status->symbol)})" ]"
		 ].
	x isBlock ifTrue: [ ^ x value: model ].
	x isNumber ifTrue: [ ^ x ].
	x isExpression ifTrue: [ ^ x evaluateWithModel: model ].
	^ x 