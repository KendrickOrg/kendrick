adding
addTransition: aTransition
	(self checkTransition: aTransition)
		ifTrue: [ transitions add: aTransition ]
		ifFalse: [ transitions addAll: (self createMoreTransitions: aTransition) ].