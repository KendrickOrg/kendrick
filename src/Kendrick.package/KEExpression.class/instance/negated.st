testing
negated
	| tmp2 |
	tmp2 := KEUnaryExpression new.
	tmp2 op: #-.
	^ tmp2 expression: self