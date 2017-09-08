as yet unclassified 
pickVariableFrom: expression AtIndex: anIndex

	| result name |
	result := KEIndexedVariable new.
	name := self createParameterName.
	model addParameter: name -> expression.
	result symbol: name.
	result addIndex: (KENumerical new number: anIndex).
	"expression class = KEBinaryExpression
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
			name := self createParameterName.
			model atParameter: name -> expression.
			result symbol: name.
			result addIndex: (KENumerical new number: anIndex) ].
	expression class = KEVariable
		ifTrue: [ result := expression copy ]."
	"expression isSeparable
		ifTrue: [  ]."
	^ result