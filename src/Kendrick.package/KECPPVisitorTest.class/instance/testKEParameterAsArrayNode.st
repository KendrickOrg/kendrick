as yet unclassified
testKEParameterAsArrayNode
	| result visitor |
	visitor := KECPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #N; value: {1000 . 2000 . 3000}).
	self assert: result = ('const double N[3] = {1000, 2000, 3000};',String cr).
	