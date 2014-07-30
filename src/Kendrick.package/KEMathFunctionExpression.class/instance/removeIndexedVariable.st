as yet unclassified
removeIndexedVariable
	|new|
	new := self copy.
	new functionExpr: functionExpr removeIndexedVariable.
	^ new