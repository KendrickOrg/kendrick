as yet unclassified
updateIndividuals
	model PIDList do: [ :pid|
		|subPop indList|
		model setPID: pid.
		subPop := model population at: pid.
		indList := subPop graph indList.
		indList do: [ :ind|
			(ind isAlive) & (ind nextStatus isNotNil) ifTrue: [ ind updateStatus: model ]
			]
		].
	