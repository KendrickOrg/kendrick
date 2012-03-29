
!KEModel methodsFor: 'as yet unclassified'!
events

| eventList |
eventList := Bag new.
equations do:[:each | eventList addAll:(each events)].
^eventList! !
