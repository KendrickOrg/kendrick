as yet unclassified
testKEEquation
	| input result visitor |	
	input := PPODEParser parse: 'S:t=beta*S*I'.
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(1); numberOfSpecies: 1).
	visitor visitNode: (KECompartment new status: #I; initialValue: #(2); numberOfSpecies: 1).
	visitor visitNode: (KEParameter new symbol: #beta; value: 0.0052).
	result := visitor visitNode: input.
	self assert: result contents = (String tab,'for (int i = 0; i < nbOfSpecies; i++)', String cr, String tab, '{', String cr, String tab, String tab, 'dxdt(0, i) = ((beta*x(0, 0))*x(1, 0));', String cr, String tab, '}', String cr).
