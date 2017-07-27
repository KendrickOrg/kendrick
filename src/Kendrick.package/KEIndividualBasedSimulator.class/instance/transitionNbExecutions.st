accessing
transitionNbExecutions
	transitionNbExecutions
		ifNil: [ transitionNbExecutions := OrderedCollection new.
			model transitions do: [ :arg1 | transitionNbExecutions add: 0 ] ].
	^ transitionNbExecutions