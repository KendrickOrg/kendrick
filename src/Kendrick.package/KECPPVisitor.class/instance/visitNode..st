as yet unclassified
visitNode: arg1
	arg1 class == KENumerical
		ifTrue: [ ^ self acceptKENumerical: arg1 ].
	arg1 class == KEModel
		ifTrue: [ ^ self acceptKEModel: arg1 ].
	arg1 class == KEVariable
		ifTrue: [ ^ self acceptKEVariable: arg1 ].
	arg1 class == KEBinaryExpression
		ifTrue: [ ^ self acceptKEBinaryExpression: arg1 ].
	arg1 class == KECompartment
		ifTrue: [ ^ self acceptKECompartment: arg1 ].
	arg1 class == KEEquation
		ifTrue: [ ^ self acceptKEEQuation: arg1 ].
	arg1 class == KEParameter
		ifTrue: [ ^ self acceptKEParameter: arg1 ].
	arg1 class == KEUnaryExpression
		ifTrue: [ ^ self acceptKEUnaryExpression: arg1 ].
	arg1 class == KEDeterministicSimulator
		ifTrue: [ ^ self acceptKEDeterministicSimulator: arg1 ].
	arg1 class == KEMathFunctionExpression
		ifTrue: [ ^ self acceptKEMathExpression: arg1 ].
	arg1 class == KESigmaFunctionExpression
		ifTrue: [ ^ self acceptKEMathExpressionSigma: arg1 ].
	arg1 class == KEIndexedVariable
		ifTrue: [ ^ self acceptKEIndexedVariable: arg1 ].
	arg1 class == KEEventOld
		ifTrue: [ ^ self acceptKEEvent: arg1 ].
	arg1 class == KETransition
		ifTrue: [ ^ self acceptKETransition: arg1 ]