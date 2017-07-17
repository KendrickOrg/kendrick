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
	"ThanhNT 6/7"
	"Reason: no such KECompartment"		
	"aNode class == KECompartment
		ifTrue: [ ^ self acceptKECompartment: aNode ]."
	"EndOf ThanhNT 6/7"
	aNode class == KEEquation
		ifTrue: [ ^ self acceptKEEQuation: aNode ].
	aNode class == KEParameter
		ifTrue: [ ^ self acceptKEParameter: aNode ].
	aNode class == KEUnaryExpression
		ifTrue: [ ^ self acceptKEUnaryExpression: aNode ].
	aNode class == KEDeterministicSimulator
		ifTrue: [ ^ self acceptKEDeterministicSimulator: aNode ].
	aNode class == KEMathFunctionExpression 
		ifTrue: [ ^ self acceptKEMathExpression: aNode ].
	"ThanhNT 6/7"
	"aNode  class == KESigmaFunctionExpression
		ifTrue: [ ^ self acceptKEMathExpressionSigma: aNode ]."
	"Endof ThanhNT 6/7"
	aNode  class == KEIndexedVariable 
		ifTrue: [ ^ self acceptKEIndexedVariable: aNode ].
	"ThanhNT 6/7"
	"Reason: No such KEEventOld"
	"aNode  class == KEEventOld
		ifTrue: [ ^ self acceptKEEvent:  aNode]."
	"EndOf ThanhNT 6/7"
	aNode class == KETransition 
		ifTrue: [ ^ self acceptKETransition: aNode ].