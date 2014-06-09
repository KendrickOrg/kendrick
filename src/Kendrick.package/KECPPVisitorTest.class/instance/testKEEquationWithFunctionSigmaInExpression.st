as yet unclassified
testKEEquationWithFunctionSigmaInExpression
	| input result visitor |	
	input := PPODEParser parse: 'S[i]:t=mu[i]*N[i]-sum(j, beta[i, j]*I[j])*S[i]-mu[i]*S[i]'.
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(9999 1000 2000); numberOfSpecies: 3).
	visitor visitNode: (KECompartment new status: #I; initialValue: #(1 0 0); numberOfSpecies: 3).
	visitor visitNode: (KEParameter new symbol: #beta; value: {{0 . 0.02 . 0.02} . {0.02 . 0 . 0} . {0.02 . 0 . 0}}).
	visitor visitNode: (KEParameter new symbol: #N; value: #(10000 1000 2000)).
	visitor visitNode: (KEParameter new symbol: #mu; value: {365/30 . 1/20 . 1/20}).
	result := visitor visitNode: input.
	self assert: result contents = (String tab,'for (int i = 0; i < nbOfSpecies; i++)', String cr, String tab, '{', String cr, String tab, String tab, 'double sumSigma = 0.0;', String cr, String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)',String cr, String tab, String tab, String tab, 'sumSigma += (beta[i][j]*x(1, j));', String cr, String tab, String tab, 'dxdt(0, i) = (((mu[i]*N[i])-(sumSigma*x(0, i)))-(mu[i]*x(0, i)));', String cr, String tab, '}', String cr).