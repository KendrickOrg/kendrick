as yet unclassified
testKEParameterNode
	| input result visitor |
	visitor := KendrickCPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #beta; value: 0.0052).
	self assert: result contents = 'const double beta = 0.0052'.
	