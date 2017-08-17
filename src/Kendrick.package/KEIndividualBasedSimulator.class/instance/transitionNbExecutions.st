accessing
transitionNbExecutions

"Apparently a trick to execute many times a transitions"

	transitionNbExecutions
		ifNil: [ transitionNbExecutions := OrderedCollection new.
			model transitions do: [ :i | transitionNbExecutions add: 0 ] ].
	^ transitionNbExecutions