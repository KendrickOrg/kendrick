as yet unclassified
testEvaluateMovementExpression
	|movementExpr model result|
	movementExpr := KEMovementExpression new movementExpressions: (self generateMovementEvents).
	model := self createSIRMetaPopulationWithMovementModel.
	model currentPopulationID: #(0 1).
	result := movementExpr evaluateWithModel: model.
	self assert: result equals: 0