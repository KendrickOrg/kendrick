as yet unclassified 
eventIndexFromTransition: aTransition
	"under constructing"
	| index |
	index := 0.
	nil == model ifFalse: [ 
		model transitions do: [ :each| 
			aTransition = each ifTrue: [ ^index ]
									ifFalse: [ index := index + 1 ].
			].
		 ].
	index >= (model transitions) size ifTrue: [ index := -1 ].
	^index.