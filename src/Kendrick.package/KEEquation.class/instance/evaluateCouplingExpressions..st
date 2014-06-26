as yet unclassified
evaluateCouplingExpressions: model	
	|result currentPID subPop|
	result := 0.
	currentPID := model getPID.
	subPop := model population at: currentPID. 
	couplingEvents do: [ :each| |temp s|
		"s is total number of individuals of the fromStatus compartment of this event"
		s := (subPop at: each fromStatus) currentNbIndividuals.
		"temp := (each evaluateInterPopInteractionWithModel: model) * s." 
		temp := (each evaluateInterRate: model) * s.
		each fromStatus = variable symbol ifTrue: [ result := result - temp ].
		each toStatus = variable symbol ifTrue: [ result := result + temp ]
		 ].
	"result := result + (self evaluateMovementEvents: model)."
	^ result 