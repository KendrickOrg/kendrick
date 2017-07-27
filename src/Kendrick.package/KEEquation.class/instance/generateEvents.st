as yet unclassified
generateEvents
	| tmp1 |
	tmp1 := expression generateEvents.
	tmp1
		do: [ :arg1 | 
			arg1 rate sign positive
				ifTrue: [ arg1
						addOneIndividualTo: variable symbol;
						toStatus: variable symbol ]
				ifFalse: [ arg1
						removeOneIndividualFrom: variable symbol;
						fromStatus: variable symbol ] ].
	^ tmp1