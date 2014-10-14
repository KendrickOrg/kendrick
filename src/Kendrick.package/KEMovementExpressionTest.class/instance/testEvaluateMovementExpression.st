as yet unclassified
testEvaluateMovementExpression
	|movementExpr model result|
	model := self createSIRMetaPopulationWithMovementModel.
	movementExpr := KEMovementExpression new movementExpressions: (self generateMovementEvents: model).
	model currentSubPopulation: model subPopulations first.
	result := movementExpr evaluateWithModel: model.
	self assert: result equals: 0