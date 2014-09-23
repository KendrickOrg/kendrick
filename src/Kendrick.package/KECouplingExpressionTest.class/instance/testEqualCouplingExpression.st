as yet unclassified
testEqualCouplingExpression
	| couplingExpr anExpression|
	couplingExpr := KECouplingExpression new 
							variable: #S; 
							couplingExpression: (KEBinaryExpression new 
								op: #*; 
								leftHandSide: (KEVariable new symbol: #beta); 
								rightHandSide: (KEVariable new symbol: #I)); 
							couplingParameter: #beta.
	anExpression := KECouplingExpression new 
							variable: #S; 
							couplingExpression: (KEBinaryExpression new 
								op: #*; 
								leftHandSide: (KEVariable new symbol: #beta); 
								rightHandSide: (KEVariable new symbol: #I)); 
							couplingParameter: #beta.
	self assert: (couplingExpr = anExpression) equals: true.
	anExpression variable: #I.
	self assert: (couplingExpr = anExpression) equals: false.