tests
testBetaPlusOne
	|  m e beta b  |
	
	m := KEModel2 new.
	m addParameter: #beta value: 2.
	beta := (KEVariable new) symbol: #beta.
	b := (KENumerical new) number: 1.
	e := (KEBinaryExpression new) op: #+; leftHandSide: beta; rightHandSide: b.
	
	self assert: (e evaluateWithModel: m) equals: 3