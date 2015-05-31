as yet unclassified
testParserAnExpression
	|beta|
	beta := PPODEParserForNetworkModel parse: 'beta*S*I'.
	self assert: beta rightHandSide isAContactVariable equals: true.
	