as yet unclassified
generateEvents
	| evts |
	evts := expression generateEvents.
	evts
		do: [ :each | 
			| status |
			status := variable symbol.
			"each eqIndex: -1."
			each rate sign positive
				ifTrue: [ each addOneIndividualTo: status ]
				ifFalse: [ each removeOneIndividualFrom: status ] ].
	^ evts