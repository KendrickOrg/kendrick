as yet unclassified
atParameter: aParameter put: anExpression
	| p |
	p := KEParameter new
		symbol: aParameter;
		expression: anExpression.
	parameters at: aParameter put: p