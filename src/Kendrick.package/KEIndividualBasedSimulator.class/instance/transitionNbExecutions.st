accessing
transitionNbExecutions
	transitionNbExecutions ifNil: [ transitionNbExecutions := OrderedCollection new.
		model transitions do: [ :i| transitionNbExecutions add: 0 ]
		 ].
	^ transitionNbExecutions 