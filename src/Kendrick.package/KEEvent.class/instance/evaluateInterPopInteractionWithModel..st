accessing
evaluateInterPopInteractionWithModel: model	
	"In this function, check hasInterPopInteraction and calculate interPopInteractionRate"
	(self hasInterPopInteraction) & (model population graph isNotNil) ifTrue: [ 
		(values at: 2) < 0 ifTrue: [ 
			|s node currentPID currentPop|
			s := 0.
			currentPID := model getPID.
			currentPop := model population at: currentPID. 
			node := "model graph atSubNode: currentPID." model population graph.
			node isRoot whileFalse: [ 
				node adjacentNodes do: [ :each| 
					model setPID: (node idOf: each).
					self setWeight: (node weightOf: each) for: model.
					s := s + (interRate evaluateWithModel: model) abs. 
					].
				node := node parent
				 ].
			model setPID: currentPID.
			values at: 2 put: s.
			 ].
		^ (values at: 2)
		 ].
	^ 0