as yet unclassified
evaluateWithModel: aModel
	|result pop|
	result := 0.
	pop := aModel currentSubPopulation.
	(movementExpressions at: pop name) do: [ :each| |temp|
		temp := each evaluateAtPopulationLevelWithModel: aModel.
		each fromStatus name = pop name ifTrue: [ result := result - temp ].
		each toStatus name = pop name ifTrue: [ result := result + temp ]
		 ].
	^ result