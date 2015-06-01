as yet unclassified
evaluateForceOfInfection: parameterOrExpression
	|formula|
	formula := self parameters at: parameterOrExpression ifAbsent: [ nil ].
	formula ifNil: [ formula := parameterOrExpression ].
	^ self population evaluateForceOfInfection: self formula: formula