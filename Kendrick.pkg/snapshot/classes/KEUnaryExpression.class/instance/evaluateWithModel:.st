
!KEUnaryExpression methodsFor: 'as yet unclassified'!
evaluateWithModel: aModel

| value |
value := expression evaluateWithModel: aModel.

op = #- ifTrue:[
		^ value negated]! !
