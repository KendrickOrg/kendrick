
!KEModel methodsFor: 'as yet unclassified'!
events

| eventList |
eventList := Bag new.

equations do:[:each | |list| 
	list := each events.
	list do:[:e |
		(e hasAnEventWithOppositeRateIn: eventList)
		ifTrue:[ |f|
			f := e findEventWithAnOppositeRateIn: eventList.
			(f actions) addAll: (e actions)]
		 ifFalse:[ eventList add:e]
		].
	].
^eventList! !
