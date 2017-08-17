accessing
transitionNbExecutions
	"Apparently a trick to execute many times a transitions"

	| additionalTrans |
	transitionNbExecutions
		ifNil: [ transitionNbExecutions := OrderedCollection new.
			additionalTrans := OrderedCollection new.
			model transitions
				do: [ :each | 
					(model checkTransition: each)
						ifTrue: [ additionalTrans add: each ]
						ifFalse: [ additionalTrans addAll: (model createMoreTransitions: each) ] ].
			additionalTrans do:
						[ :i | transitionNbExecutions add: 0 ] ].
	^ transitionNbExecutions