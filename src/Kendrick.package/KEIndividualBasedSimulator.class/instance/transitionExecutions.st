as yet unclassified
transitionExecutions
	transitionExecutions ifNil: [ transitionExecutions := Array new: model transitions size.
		1 to: model transitions size do: [ :i| transitionExecutions at: i put: 0 ]
		 ].
	^ transitionExecutions 