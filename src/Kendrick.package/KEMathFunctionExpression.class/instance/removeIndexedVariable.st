evaluating
removeIndexedVariable
	| tmp1 |
	tmp1 := self copy.
	tmp1 functionExpr: functionExpr removeIndexedVariable.
	^ tmp1