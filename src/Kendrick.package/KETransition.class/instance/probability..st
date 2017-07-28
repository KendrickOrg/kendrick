accessing
probability: aBlockOrAnExpression
	|prob|
	prob := aBlockOrAnExpression.
	aBlockOrAnExpression isString ifTrue: [ prob := aBlockOrAnExpression parseAsAnExpression ].
	probability := prob 