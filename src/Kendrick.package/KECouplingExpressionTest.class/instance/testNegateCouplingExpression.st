as yet unclassified
testNegateCouplingExpression
	| couplingExpr newExpr|
	couplingExpr := KECouplingExpression new 
							variable: #S; 
							couplingExpression: (KEBinaryExpression new 
								op: #*; 
								leftHandSide: (KEVariable new symbol: #beta); 
								rightHandSide: (KEVariable new symbol: #I)); 
							couplingParameter: #beta.
	newExpr := couplingExpr negated.
	self assert: newExpr couplingExpression isUnaryExpression equals: true.
	self assert: newExpr sign equals: -1