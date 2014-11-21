accessing
probability: aBlock
	aBlock numArgs < 3 ifTrue: [ ^ self error: 'A Transition demands a block of three arguments' ].
	probability := aBlock 