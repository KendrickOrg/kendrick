as yet unclassified
testKEEquation
	| input result visitor |
	
	input := PPODEParser parse: 'S:t=beta*S*I'.
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(1)).
	visitor visitNode: (KECompartment new status: #I; initialValue: #(2)).
	visitor visitNode: (KEParameter new symbol: #beta; value: 0.0052).
	result := visitor visitNode: input.
	"self halt."
	self assert: result contents = (String tab,'dxdt[0]=((beta*x[0])*x[1]);', String cr).
