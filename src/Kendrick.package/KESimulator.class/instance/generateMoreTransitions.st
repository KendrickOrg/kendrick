private
generateMoreTransitions
	"Going to be remove"
	| additionalTrans |
	additionalTrans := OrderedCollection new.
	model transitions
		do: [ :each | 
			(model checkTransition: each)
				ifTrue: [ additionalTrans add: each ]
				ifFalse: [ additionalTrans addAll: (model createMoreTransitions: each) ] ].
	^ additionalTrans