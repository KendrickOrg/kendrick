converting
normalize
	|e|
	e := expression normalize.
	e isUnaryExpression ifTrue: [^ (e expression)] ifFalse: [^ ((KEUnaryExpression new) op: #-; expression: e)].