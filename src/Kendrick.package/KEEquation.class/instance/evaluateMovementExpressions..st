as yet unclassified
evaluateMovementExpressions: model
	|result currentPID|
	result := 0.
	currentPID := model getPID.
	movementEvents ifNotNil: [ 
		(movementEvents at: currentPID) do: [ :each|
			each fromStatus = currentPID ifTrue: [ result := result - (each evaluateWithModel: model) ].
			each toStatus = currentPID ifTrue: [ result := result + (each evaluateWithModel: model) ]
			 ]
		 ].
	^ result