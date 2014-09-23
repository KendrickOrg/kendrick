as yet unclassified
testCreateMovementExpressions
	|model movementAdapter|
	model := self createSIRMetaPopulationWithMovementModel.
	movementAdapter := KEMovementAdapter new.
	movementAdapter atArgument: #model put: model.
	movementAdapter init.
	
	self assert: (model equations size) equals: 2.
	self assert: (model atEquation: #S) expression rightHandSide isMovementExpression equals: true.
	self assert: (model atEquation: #S) expression rightHandSide movementExpressions size equals: 3.
	self assert: ((model atEquation: #S) expression rightHandSide movementExpressions at: #(0 1)) size equals: 4.
	self assert: (model atEquation: #I) expression rightHandSide isMovementExpression equals: true.
	self assert: (model atEquation: #I) expression rightHandSide movementExpressions size equals: 3.
	self assert: ((model atEquation: #I) expression rightHandSide movementExpressions at: #(0 1)) size equals: 4.