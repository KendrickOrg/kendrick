comparing
= arg1
	arg1 isNumber
		ifTrue: [ ^ self = (KENumerical new number: arg1) ].
	arg1 isExpressionWithSigmaMathFunction
		ifTrue: [ ^ self functionName = arg1 functionName
				and: [ self functionExpr = arg1 functionExpr
						and: [ self idVariable = arg1 idVariable ] ] ].
	^ false