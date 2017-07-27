adding
addParameter: arg1 value: arg2
	| tmp1 tmp3 |
	arg2 isNumber
		ifTrue: [ tmp1 := KENumerical new number: arg2 ]
		ifFalse: [ arg2 isString
				ifTrue: [ tmp1 := arg2 parseAsAnExpression ]
				ifFalse: [ tmp1 := arg2 ] ].
	tmp3 := KEParameter new.
	tmp3 symbol: arg1.
	parameters at: arg1 put: (tmp3 expression: tmp1)