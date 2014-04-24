as yet unclassified
evaluateInterPopInteractionWithModel: model	
	|result|
	result := 0.
	interPopInteractionEvents do: [ :each| |temp|
		temp := each evaluateInterPopInteractionWithModel: model. 
		each fromStatus = variable symbol ifTrue: [ result := result - temp ].
		each toStatus = variable symbol ifTrue: [ result := result + temp ]
		 ].
	^ result