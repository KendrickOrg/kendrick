as yet unclassified
testCreateCouplingExpression
	|model couplingAdapter|
	model := self createAMetaPopulationModel.
	couplingAdapter := KECouplingAdapter new.
	couplingAdapter atArgument: #model put: model.
	couplingAdapter init.
	 
	self assert: (model equations size) equals: 3.
	self assert: (model atEquation: #S) expression rightHandSide isCouplingExpression equals: true.
	self assert: (model atEquation: #S) expression rightHandSide sign equals: -1.
	self assert: (model atEquation: #I) expression rightHandSide isCouplingExpression equals: true.
	self assert: (model atEquation: #I) expression rightHandSide sign equals: 1.
	