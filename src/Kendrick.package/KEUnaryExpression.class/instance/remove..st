removing
remove: arg1
	| tmp1 |
	tmp1 := KEUnaryExpression new op: #-.
	tmp1 expression: (expression remove: arg1).
	^ tmp1