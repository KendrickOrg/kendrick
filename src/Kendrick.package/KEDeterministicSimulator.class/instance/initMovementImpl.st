as yet unclassified
initMovementImpl
	(model population atParameter: #movement) ifNotNil: [ 
		|movementImpl events|
		movementImpl := (KERuntimeMovementEventImpl new) model: model.
		events := movementImpl events.
		model equations do: [ :eq|
			|movementExprImpl|
			movementExprImpl := KEMovementExprImpl new.
			movementExprImpl arguments at: #1 put: events.
			movementExprImpl arguments at: #2 put: eq.
			eq rtExprImpls add: movementExprImpl
			 ]
		 ]
	
	