accessing
probability: arg1
	| tmp1 |
	tmp1 := arg1.
	arg1 isString
		ifTrue: [ tmp1 := arg1 parseAsAnExpression ].
	probability := tmp1