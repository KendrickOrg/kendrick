as yet unclassified
acceptKEMathExpressionSigma: arg1
	| tmp1 tmp7 tmp9 |
	tmp1 := WriteStream on: (String new: 60).
	strInitializeKEMath := WriteStream on: (String new: 60).
	arg1 idVariable = #j
		ifFalse: [ arg1 idVariable = #j ].
	defSumSigma
		ifTrue: [ | tmp5 |
			tmp5 := strInitializeKEMath.
			tmp5
				nextPutAll: String tab , String tab , 'sumSigma = 0.0;';
				cr ]
		ifFalse: [ | tmp3 |
			tmp3 := strInitializeKEMath.
			tmp3
				nextPutAll: String tab , String tab , 'double sumSigma = 0.0;';
				cr ].
	tmp7 := strInitializeKEMath.
	tmp7
		nextPutAll: String tab , String tab , 'for (int j = 0; j < nbOfSpecies; j++)';
		cr.
	strInitializeKEMath
		nextPutAll: String tab , String tab , String tab , 'sumSigma += '.
	tmp9 := strInitializeKEMath.
	tmp9
		nextPutAll: (self visitNode: arg1 functionExpr) , ';';
		cr.
	defSumSigma := true.
	tmp1 nextPutAll: 'sumSigma'.
	^ tmp1 contents