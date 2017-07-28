evaluating
removeIndexedVariable
	|new|
	new := self copy.
	new functionExpr: functionExpr removeIndexedVariable.
	^ new