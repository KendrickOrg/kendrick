as yet unclassified
generateEvents: arg1
	| tmp1 |
	tmp1 := expression generateEvents: arg1.
	tmp1
		do: [ :arg2 | 
			arg2 rate sign positive
				ifTrue: [ arg2
						addOneIndividualTo: variable symbol;
						toStatus: variable symbol ]
				ifFalse: [ arg2
						removeOneIndividualFrom: variable symbol;
						fromStatus: variable symbol ] ].
	^ tmp1