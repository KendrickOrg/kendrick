as yet unclassified
testKEParameterAs3DArrayNode
	| result visitor |
	visitor := KECPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #mu; value: #(#(#(1 2) #(1 2)) #(#(3 4) #(3 4))) ).
	self assert: result = ('const double mu[2][2][2] = {{{1.0, 2.0}, {1.0, 2.0}}, {{3.0, 4.0}, {3.0, 4.0}}};',String cr).
	