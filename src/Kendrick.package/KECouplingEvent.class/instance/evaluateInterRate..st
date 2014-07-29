as yet unclassified
evaluateInterRate: model
	|s pid|
	s := 0.
	(self interRateIsEvaluable: model)
	ifTrue: [ 
	   |aNode currentPID currentPop|
		currentPID := model getPID.
		currentPop := model population at: currentPID. 
		aNode := currentPop.
		pid := aNode id asArray.
		[ aNode isRoot ] whileFalse: [ |tmp|
			aNode := aNode parent.
			tmp := aNode graph nodes at: (pid last).
			tmp adjacentNodes do: [ :each| 
				model setPopulationID: (aNode at: each) id asArray.
				self setWeight: (tmp weight: weight of: each) for: model.
				s := s + (couplingRate evaluateWithModel: model) abs. 
				 ].
			pid := aNode id
			 ].
			model setPopulationID: currentPID.
			model temporalParameters removeKey: weight
		 ].
	^ s