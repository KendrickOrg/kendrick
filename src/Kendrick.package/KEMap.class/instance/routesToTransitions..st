as yet unclassified
routesToTransitions: aBlockOrAnExpression
	|transitions|
	transitions := edges collect: [ :each|
		KETransition 
			from: { #country->each key } 
			to: { #country->each value } 
			probability: aBlockOrAnExpression 	
	].
	^ transitions