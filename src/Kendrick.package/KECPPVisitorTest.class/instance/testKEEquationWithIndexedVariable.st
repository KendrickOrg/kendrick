as yet unclassified
testKEEquationWithIndexedVariable
	| input result visitor |	
	input := PPODEParser parse: 'S[i]:t=beta*S[i]*I[i]'.
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(1 2); numberOfSpecies: 2).
	visitor visitNode: (KECompartment new status: #I; initialValue: #(2 3); numberOfSpecies: 2).
	visitor visitNode: (KEParameter new symbol: #beta; value: 0.0052).
	result := visitor visitNode: input.
	self assert: result contents = (String tab,'for (int i = 0; i < nbOfSpecies; i++)', String cr, String tab, '{', String cr, String tab, String tab, 'dxdt(0, i) = ((beta*x(0, i))*x(1, i));', String cr, String tab, '}', String cr).
