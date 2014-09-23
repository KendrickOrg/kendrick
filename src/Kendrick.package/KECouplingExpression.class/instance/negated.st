acessing
negated
	|new|
	new := self copy.
	new couplingExpression: (self couplingExpression negated).
	^ new