as yet unclassified 
pickVariableFrom: expression AtIndex: anIndex
	| result |
	expression class = KEBinaryExpression
		ifTrue: [ result := KEBinaryExpression new.
			result leftHandSide: (self pickVariableFrom: expression leftHandSide AtIndex: anIndex).
			result
				rightHandSide: (self pickVariableFrom: expression rightHandSide AtIndex: anIndex).
			result op: expression op ].
	expression class = KEIndexedVariable
		ifTrue: [ result := expression pickVariableAtIndexedValue: anIndex ].
	expression class = KEUnaryExpression
		ifTrue: [ result := KEUnaryExpression new.
			result expression: (self pickVariableFrom: expression expression AtIndex: anIndex).
			result op: expression op ].
	expression class = KESigmaFunctionExpression
		ifTrue: [ result := KESigmaFunctionExpression new.
			result functionExpr: (self pickVariableFrom: expression functionExpr AtIndex: anIndex).
			result idVariable: expression idVariable.
			result functionName: expression functionName ].
	expression class = KEVariable
		ifTrue: [ result := expression copy ].
	"expression isSeparable
		ifTrue: [  ]."
	^ result