as yet unclassified
testEvaluateCouplingExpression
	|couplingExpr model result|
	couplingExpr := KECouplingExpression new 
							variable: #S; 
							couplingExpression: (KEBinaryExpression new 
								op: #*; 
								leftHandSide: (KEVariable new symbol: #beta); 
								rightHandSide: (KEVariable new symbol: #I)); 
							couplingParameter: #beta.
	model := self createAMetaPopulationModel.
	model currentSubPopulation: model subPopulations first.
	result := couplingExpr evaluateWithModel: model.
	self assert: result equals: 40