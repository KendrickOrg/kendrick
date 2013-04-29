as yet unclassified
testKEParameterNode
	| input result visitor |
	visitor := KECPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #beta; value: 0.0052).
	self assert: result = ('const double beta = 0.0052;',String cr).
	