as yet unclassified
evaluateWithModel: model
	|result currentPID|
	result := 0.
	currentPID := model getPID.
	self runtimeExpr ifNotNil: [ 
		(runtimeExpr at: currentPID) do: [ :each|
			each fromStatus = currentPID ifTrue: [ result := result - (each evaluateWithModel: model) ].
			each toStatus = currentPID ifTrue: [ result := result + (each evaluateWithModel: model) ]
			 ]
		 ].
	^ result