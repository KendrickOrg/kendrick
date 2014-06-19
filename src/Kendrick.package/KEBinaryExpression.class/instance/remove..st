as yet unclassified
remove: aVariable
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"
	|new|
	new := (KEBinaryExpression new) op: op; leftHandSide: (leftHandSide remove: aVariable); rightHandSide: (rightHandSide remove: aVariable).
	new checkNil ifTrue: [ ^ nil ].
	new leftHandSide ifNil: [ ^ rightHandSide ].
	new rightHandSide ifNil: [ ^ leftHandSide ].
	new leftHandSide isUnaryExpression & new leftHandSide checkNil ifTrue: [ ^ (KEUnaryExpression new) op: #-; expression: rightHandSide ].
	new rightHandSide isUnaryExpression & new rightHandSide checkNil ifTrue: [ ^ (KEUnaryExpression new) op: #-; expression: leftHandSide ].
	 ^ new

