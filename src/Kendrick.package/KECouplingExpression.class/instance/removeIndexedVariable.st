acessing
removeIndexedVariable
	|new|
	new := self copy.
	new couplingExpression: (self couplingExpression removeIndexedVariable).
	^ new