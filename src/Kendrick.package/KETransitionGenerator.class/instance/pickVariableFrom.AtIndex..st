as yet unclassified 
pickVariableFrom: expression AtIndex: anIndex
	| result expStr |
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
		ifTrue: [ result := KEIndexedVariable new.
			result expression: expression.
			result addIndex: (KENumerical new number: anIndex) ].	"expStr := expression asString.
			expStr := '(' , expStr , ')[' , anIndex asString, ']'."	"tmp := KESigmaFunctionExpression new."
	"result functionExpr: (self pickVariableFrom: expression functionExpr AtIndex: anIndex)."
	"tmp functionExpr: expression functionExpr."
	"tmp idVariable: expression idVariable.
			tmp functionName: expression functionName."
	expression class = KEVariable
		ifTrue: [ result := expression copy ].
	"expression isSeparable
		ifTrue: [  ]."
	^ result