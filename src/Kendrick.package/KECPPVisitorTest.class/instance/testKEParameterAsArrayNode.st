as yet unclassified
testKEParameterAsArrayNode
	| result visitor |
	visitor := KECPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #N; value: {1000 . 2000 . 3000}).
	self assert: result = ('const double N[3] = {1000.0, 2000.0, 3000.0};',String cr).
	result := visitor visitNode: (KEParameter new symbol: #mu; value: {365/30 . 1/20. 1/20}).
	self assert: result = ('const double mu[3] = {12.166666666666666, 0.05, 0.05};', String cr).
	