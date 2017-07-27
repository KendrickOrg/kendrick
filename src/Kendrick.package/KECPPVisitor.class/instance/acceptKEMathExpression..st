as yet unclassified
acceptKEMathExpression: arg1
	| tmp1 |
	tmp1 := WriteStream on: (String new: 60).
	tmp1 nextPutAll: arg1 functionName asString.
	arg1 functionExpr class == KEVariable
		| (arg1 functionExpr class == KENumerical)
		ifTrue: [ tmp1 nextPutAll: '(' ].
	tmp1 nextPutAll: (self visitNode: arg1 functionExpr).
	arg1 functionExpr class == KEVariable
		| (arg1 functionExpr class == KENumerical)
		ifTrue: [ tmp1 nextPutAll: ')' ].
	^ tmp1 contents