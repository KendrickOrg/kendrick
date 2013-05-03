as yet unclassified
testKEUnaryExpression
	| input result visitor |
	input := ('S:t=-beta*(S+I)' parseAsAnEquation) expression. 
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(9999)).
	visitor visitNode: (KECompartment new status: #I; initialValue: #(1)).
	visitor visitNode: (KEParameter new symbol: #beta; value: 0.0052).
	result := visitor visitNode: input.

	self assert: result contents = '((-beta)*(x[0]+x[1]))'.
	