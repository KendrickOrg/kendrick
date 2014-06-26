as yet unclassified
evaluateWithModel: model
	|result currentPID subPop eq|
	eq := self arguments at: #2.
	result := 0.
	currentPID := model getPID.
	subPop := model population at: currentPID. 
	runtimeExpr do: [ :each| |temp s|
		"s is total number of individuals of the fromStatus compartment of this event"
		s := (subPop at: each fromStatus) currentNbIndividuals.
		"temp := (each evaluateInterPopInteractionWithModel: model) * s." 
		temp := (each evaluateInterRate: model) * s.
		each fromStatus = eq variable symbol ifTrue: [ result := result - temp ].
		each toStatus = eq variable symbol ifTrue: [ result := result + temp ]
		 ].
	"result := result + (self evaluateMovementEvents: model)."
	^ result 