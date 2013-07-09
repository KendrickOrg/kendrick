as yet unclassified
testKEParameterAs2DArrayNode
	| result visitor |
	visitor := KECPPVisitor new.
	result := visitor visitNode: ((KEParameter new) symbol: #beta; value: {{0 . 0.02 . 0.02} . {0.02 . 0 . 0} . {0.02 . 0 . 0}}).
	self assert: result = ('const double beta[3][3] = {{0.0, 0.02, 0.02}, {0.02, 0.0, 0.0}, {0.02, 0.0, 0.0}};',String cr).
	