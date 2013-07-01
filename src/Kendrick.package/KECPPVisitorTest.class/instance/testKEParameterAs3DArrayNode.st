as yet unclassified
testKEParameterAs3DArrayNode
	| result visitor |
	visitor := KECPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #mu; value: #(#(#(1 2) #(1 2)) #(#(3 4) #(3 4))) ).
	self assert: result = ('const double mu[2][2][2] = {{{1, 2}, {1, 2}}, {{3, 4}, {3, 4}}};',String cr).
	