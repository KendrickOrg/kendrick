accessing
transitionNbExecutions
	"Apparently a trick to execute many times a transitions"

	| additionalTrans |
	transitionNbExecutions
		ifNil: [ transitionNbExecutions := OrderedCollection new.
			additionalTrans := self generateMoreTransitions.
			additionalTrans do: [ :i | transitionNbExecutions add: 0 ] ].
	^ transitionNbExecutions