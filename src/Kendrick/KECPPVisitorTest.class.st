Class {
	#name : #KECPPVisitorTest,
	#superclass : #TestCase,
	#category : 'Kendrick-Tests-Code-Generators'
}

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> expectedFailures [

^{#testKEEquation. #testKEEquationWithIndexedVariable. #testKEBinaryExpressionWithOneCompartment. #testKEBinaryExpressionWithParentheses. #testKECompartmentNode. #testKEEquationWithFunctionSigmaInExpression. #testKEUnaryExpression. #testKEVariableNode. #testKEParameterAs2DArrayNode. #testKEParameterAs3DArrayNode. #testKEParameterAsArrayNode. #testKEParameterNode}
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEBinaryExpression [
	| input result a b o |
	input := KEBinaryExpression new.
	a := KENumerical new.
	a number: 3.
	b := KENumerical new.
	b number: 7.
	o := #+.
	input
		op: o;
		leftHandSide: a;
		rightHandSide: b.

	result := KECPPVisitor new visitNode: input.
	
	self assert: result contents = '(3+7)'.
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEBinaryExpressionWithOneCompartment [
	| input result a b o visitor |
	input := KEBinaryExpression new.
	a := KEVariable symbol: #S.
	b := KENumerical new.
	b number: 2.
	o := #*.
	input
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(9999); numberOfSpecies: 1).
	result := visitor visitNode: input.
	self assert: result contents = '(x(0, 0)*2)'
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEBinaryExpressionWithParentheses [
	| input result visitor |
	input := ('S:t=beta*(S+I)' parseAsAnEquation) expression. 
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(9999); numberOfSpecies: 1).
	visitor visitNode: (KECompartment new status: #I; initialValue: #(1); numberOfSpecies: 1).
	visitor visitNode: (KEParameter new symbol: #beta; value: 0.0052).
	result := visitor visitNode: input.

	self assert: result contents = '(beta*(x(0, 0)+x(1, 0)))'.
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKECompartmentNode [
	| input result visitor |
	input := (KECompartment new status: #S; initialValue:  #(9999); numberOfSpecies: 1).
	visitor := KECPPVisitor new.
	result := visitor visitNode: input.
	
	self assert: result = (String tab,'compartmentName[0] = "S";', String cr, String tab, 'initialValue[0][0] = 9999;', String cr).
	
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEEquation [
	| input result visitor |	
	input := PPODEParser parse: 'S:t=beta*S*I'.
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(1); numberOfSpecies: 1).
	visitor visitNode: (KECompartment new status: #I; initialValue: #(2); numberOfSpecies: 1).
	visitor visitNode: (KEParameter new symbol: #beta; value: 0.0052).
	result := visitor visitNode: input.
	self assert: result contents = (String tab,'for (int i = 0; i < nbOfSpecies; i++)', String cr, String tab, '{', String cr, String tab, String tab, 'dxdt(0, i) = ((beta*x(0, 0))*x(1, 0));', String cr, String tab, '}', String cr).

]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEEquationWithFunctionSigmaInExpression [
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
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEEquationWithIndexedVariable [
	| input result visitor |	
	input := PPODEParser parse: 'S[i]:t=beta*S[i]*I[i]'.
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(1 2); numberOfSpecies: 2).
	visitor visitNode: (KECompartment new status: #I; initialValue: #(2 3); numberOfSpecies: 2).
	visitor visitNode: (KEParameter new symbol: #beta; value: 0.0052).
	result := visitor visitNode: input.
	self assert: result contents = (String tab,'for (int i = 0; i < nbOfSpecies; i++)', String cr, String tab, '{', String cr, String tab, String tab, 'dxdt(0, i) = ((beta*x(0, i))*x(1, i));', String cr, String tab, '}', String cr).

]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEMathExpressionWithExpressionAsAVariable [
	|input visitor result|
	input := KEMathFunctionExpression new functionName: #cos; functionExpr: (KEVariable new symbol: #t).
	visitor := KECPPVisitor new.
	result := visitor visitNode: input.
	
	self assert: result = 'cos(t)'.
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEMathExpressionWithExpressionAsBinaryExpression [
	|input visitor result expr|
	expr := KEBinaryExpression new 
				op: #*; 
				leftHandSide: (KENumerical new number: 2);
				rightHandSide: (KEVariable new symbol: #t).
	input := KEMathFunctionExpression new functionName: #cos; functionExpr: expr .
	visitor := KECPPVisitor new.
	result := visitor visitNode: input.
	
	self assert: result = 'cos(2*t)'.
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKENumericalNode [
	| input result|
	input := KENumerical number: 1.
	result := KECPPVisitor new visitNode: input.
	
	self assert: result contents = '1'.
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEParameterAs2DArrayNode [
	| result visitor |
	visitor := KECPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #beta; value: {{0 . 0.02 . 0.02} . {0.02 . 0 . 0} . {0.02 . 0 . 0}}).
	self assert: result = ('const double beta[3][3] = {{0.0, 0.02, 0.02}, {0.02, 0.0, 0.0}, {0.02, 0.0, 0.0}};',String cr).
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEParameterAs3DArrayNode [
	| result visitor |
	visitor := KECPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #mu; value: #(#(#(1 2) #(1 2)) #(#(3 4) #(3 4))) ).
	self assert: result = ('const double mu[2][2][2] = {{{1.0, 2.0}, {1.0, 2.0}}, {{3.0, 4.0}, {3.0, 4.0}}};',String cr).
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEParameterAsArrayNode [
	| result visitor |
	visitor := KECPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #N; value: {1000 . 2000 . 3000}).
	self assert: result = ('const double N[3] = {1000.0, 2000.0, 3000.0};',String cr).
	result := visitor visitNode: (KEParameter new symbol: #mu; value: {365/30 . 1/20. 1/20}).
	self assert: result = ('const double mu[3] = {12.166666666666666, 0.05, 0.05};', String cr).
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEParameterNode [
	| input result visitor |
	visitor := KECPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #beta; value: 0.0052).
	self assert: result = ('const double beta = 0.0052;',String cr).
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEUnaryExpression [
	| input result visitor |
	input := ('S:t=-beta*(S+I)' parseAsAnEquation) expression. 
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(9999); numberOfSpecies: 1).
	visitor visitNode: (KECompartment new status: #I; initialValue: #(1); numberOfSpecies: 1).
	visitor visitNode: (KEParameter new symbol: #beta; value: 0.0052).
	result := visitor visitNode: input.

	self assert: result contents = '((-beta)*(x(0, 0)+x(1, 0)))'.
	
]

{ #category : #'as yet unclassified' }
KECPPVisitorTest >> testKEVariableNode [
	| input result visitor |
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(1); numberOfSpecies: 1).
	input := KEVariable symbol: #S.
	result := visitor visitNode: input.
	self assert: result  = 'x(0, 0)'
]
