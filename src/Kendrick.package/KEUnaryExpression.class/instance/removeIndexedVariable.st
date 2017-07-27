evaluating
removeIndexedVariable
	| tmp1 |
	tmp1 := self copy.
	tmp1 expression: expression removeIndexedVariable.
	^ tmp1