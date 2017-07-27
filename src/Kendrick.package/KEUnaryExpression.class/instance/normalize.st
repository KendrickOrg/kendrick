converting
normalize
	| tmp1 tmp3 |
	tmp1 := expression normalize.
	tmp1 isUnaryExpression
		ifTrue: [ ^ tmp1 expression ].
	tmp3 := KEUnaryExpression new.
	tmp3 op: #-.
	^ tmp3 expression: tmp1