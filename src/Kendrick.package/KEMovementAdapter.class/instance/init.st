as yet unclassified
init
	|model movementEvents|
	model := self model.
	movementEvents := self generateMovementEvents.
	movementEvents keys do: [ :symbol| |expr movementExpr|
		expr := (model atEquation: symbol) expression.
		movementExpr := (KEMovementExpression new) movementExpressions: (movementEvents at: symbol).
		(model atEquation: symbol) expression: (expr addExpression: movementExpr) 
		 ]
	