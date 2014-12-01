as yet unclassified
evaluateWithModel: model
	|x subPop|
	x := model atParameter: symbol.
	x ifNil: [ |tmp|
		subPop := model atParameter: #subPopulation.
		subPop ifNil: [ ^ model atCompartment: (Dictionary newFrom: {(#status->symbol)}) ].
		tmp := subPop copy. 
		x := model atParameter: (Dictionary newFrom: {(tmp->symbol)}).
		x ifNil: [ ^ model atCompartment: (Dictionary newFrom: {(#status->symbol)}) ]
		 ].
	x isBlock ifTrue: [ ^ x value: model ].
	x isNumber ifTrue: [ ^ x ].
	x isExpression ifTrue: [ ^ x evaluateWithModel: model ].
	^ x 