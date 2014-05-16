accessing
evaluateInterPopInteractionWithModel: model	
	"In this function, check hasInterPopInteraction and calculate interPopInteractionRate"
	|s pid|
	s := 0.
	(self hasInterPopInteraction) & (model population graph isNotNil) ifTrue: [ 
	   |n currentPID currentPop|
		currentPID := model getPID.
		currentPop := model population at: currentPID. 
		n := currentPop.
		pid := n id asArray.
		[ n isRoot ] whileFalse: [ |tmp|
			n := n parent.
			tmp := n graph nodes at: (pid last).
			tmp adjacentNodes do: [ :each| 
				model setPID: (n at: each) id asArray.
				self setWeight: (tmp weight: weight of: each) for: model.
				s := s + (interRate evaluateWithModel: model) abs. 
				 ].
			pid := n id.
			 ].
			model setPID: currentPID.
			model temporalParameters removeKey: weight
		 ].
	^ s

