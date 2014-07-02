as yet unclassified
testKEIndexedVariableNode
	| input result visitor |
	visitor := KECPPVisitor new.
	visitor visitNode: (KECompartment new status: #S; initialValue: #(1); numberOfSpecies: 1).
	visitor visitNode: (KEParameter new symbol: #beta; value: #(#(1 2) #(1 2)); expression: nil).
	
	input := KEIndexedVariable new symbol: #S; idExpression1: 'j'; idExpression2: -1.
	result := visitor visitNode: input.
	self assert: result  = 'x(0, j)'.
	
	input := KEIndexedVariable new symbol: #S; idExpression1: 1; idExpression2: -1.
	result := visitor visitNode: input.
	self assert: result = 'x(0, 1)'.
	
	input := KEIndexedVariable new symbol: #beta; idExpression1: 'i'; idExpression2: 'j'.
	result := visitor visitNode: input.
	self assert: result = 'beta[i][j]'.
	
	input := KEIndexedVariable new symbol: #beta; idExpression1: 1; idExpression2: 'j'.
	result := visitor visitNode: input.
	self assert: result = 'beta[1][j]'.
	
	input := KEIndexedVariable new symbol: #beta; idExpression1: 'k'; idExpression2: 'i'.
	result := visitor visitNode: input.
	self assert: result = 'beta[i][i]'.
	
	input := KEIndexedVariable new symbol: #beta; idExpression1: 'j'; idExpression2: -1.
	result := visitor visitNode: input.
	self assert: result = 'beta[j]'.