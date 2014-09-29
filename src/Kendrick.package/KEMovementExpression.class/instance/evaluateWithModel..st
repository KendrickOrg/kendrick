as yet unclassified
evaluateWithModel: aModel
	|result currentPID|
	result := 0.
	currentPID := aModel currentPopulationID.
	(movementExpressions at: currentPID) do: [ :each| |temp|
		temp := each evaluateAtPopulationLevelWithModel: aModel.
		each fromStatus = currentPID ifTrue: [ result := result - temp ].
		each toStatus = currentPID ifTrue: [ result := result + temp ]
		 ].
	^ result