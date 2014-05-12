as yet unclassified
evaluateInterPopInteractionWithModel: model	
	|result currentPID subPop|
	result := 0.
	currentPID := model getPID.
	subPop := model population at: currentPID. 
	interPopInteractionEvents do: [ :each| |temp s|
		"s is total number of individuals of the fromStatus compartment of this event"
		s := (subPop at: each fromStatus) currentNbIndividuals.
		temp := (each evaluateInterPopInteractionWithModel: model) * s. 
		each fromStatus = variable symbol ifTrue: [ result := result - temp ].
		each toStatus = variable symbol ifTrue: [ result := result + temp ]
		 ].
	^ result