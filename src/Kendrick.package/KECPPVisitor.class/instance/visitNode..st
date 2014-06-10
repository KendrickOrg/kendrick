as yet unclassified
visitNode: aNode
	aNode class == KENumerical
		ifTrue: [ ^ self acceptKENumerical: aNode ].
	aNode class == KEModel
		ifTrue: [ ^ self acceptKEModel: aNode ].
	aNode class == KEVariable
		ifTrue: [ ^ self acceptKEVariable: aNode ].
	aNode class == KEBinaryExpression
		ifTrue: [ ^ self acceptKEBinaryExpression: aNode ].
	aNode class == KECompartment
		ifTrue: [ ^ self acceptKECompartment: aNode ].
	aNode class == KEEquation
		ifTrue: [ ^ self acceptKEEQuation: aNode ].
	aNode class == KEParameter
		ifTrue: [ ^ self acceptKEParameter: aNode ].
	aNode class == KEUnaryExpression
		ifTrue: [ ^ self acceptKEUnaryExpression: aNode ].
	aNode class == KEDeterministicSimulator
		ifTrue: [ ^ self acceptKEDeterministicSimulator: aNode ].
	aNode class == KEMathExpression 
		ifTrue: [ ^ self acceptKEMathExpression: aNode ].
	aNode  class == KEMathExpressionSigma
		ifTrue: [ ^ self acceptKEMathExpressionSigma: aNode ].
	aNode  class == KEIndexedVariable 
		ifTrue: [ ^ self acceptKEIndexedVariable: aNode ].
	aNode  class == KEEvent
		ifTrue: [ ^ self acceptKEEvent:  aNode].
	aNode class == KETransition 
		ifTrue: [ ^ self acceptKETransition: aNode ].