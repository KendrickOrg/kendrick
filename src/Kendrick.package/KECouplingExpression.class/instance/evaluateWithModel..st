acessing
evaluateWithModel: aModel
	|result currentPID population |
	result := 0.
	currentPID := aModel currentPopulationID.
	population := aModel population at: currentPID.
	couplingExpressions do: [ :each| |temp s|
		s := (population at: (each fromStatus)) currentNbIndividuals.
		temp := (each evaluateInterRate: aModel) * s.
		each fromStatus = odeVariableSymbol ifTrue: [ result := result - temp ].
		each toStatus = odeVariableSymbol ifTrue: [ result := result + temp ].
		 ].
	^ result