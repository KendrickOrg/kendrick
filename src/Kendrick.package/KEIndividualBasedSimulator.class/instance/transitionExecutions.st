as yet unclassified
transitionExecutions
	transitionExecutions ifNil: [ transitionExecutions := OrderedCollection new.
		model transitions do: [ :i| transitionExecutions add: 0 ]
		 ].
	^ transitionExecutions 