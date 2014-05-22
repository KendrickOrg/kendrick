as yet unclassified
removeIndexedVariable
	|new|
	new := self copy.
	new exprInFunction: exprInFunction removeIndexedVariable.
	^ new