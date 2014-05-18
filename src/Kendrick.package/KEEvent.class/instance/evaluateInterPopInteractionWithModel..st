accessing
evaluateInterPopInteractionWithModel: model	
	"In this function, check hasInterPopInteraction and calculate interPopInteractionRate"
	|s pid|
	s := 0.
	(self checkGraph: model)
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
				model setPID: (aNode at: each) id asArray.
				self setWeight: (tmp weight: weight of: each) for: model.
				s := s + (interRate evaluateWithModel: model) abs. 
				 ].
			pid := aNode id
			 ].
			model setPID: currentPID.
			model temporalParameters removeKey: weight
		 ].
	^ s

