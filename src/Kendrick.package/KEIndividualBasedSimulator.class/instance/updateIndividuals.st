as yet unclassified
updateIndividuals
	model population individuals do: [ :ind| 
		((ind isAlive) and: [ ind nextStatus isNotNil ]) ifTrue: [ 
			ind nextStatus = #empty ifTrue: [ model population removeIndividual: ind ] ifFalse: [ 
				ind updateAttributes: ind nextStatus.
				ind currentStatus: ind nextStatus.
				ind nextStatus: nil ]
			 ]
		].
	1 to: model transitions size do: [ :i|
		|tr|
		tr := model transitions at: i.
		tr executeOn: model times: (self transitionExecutions at: i).
		self transitionExecutions at: i put: 0
		 ]
	