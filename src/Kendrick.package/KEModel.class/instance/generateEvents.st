as yet unclassified
generateEvents

events := Bag new.
equations do:[:each | |list| 
	list := each generateEvents.
	list do:[:e |
		(e hasAnEventWithOppositeRateIn: events)
		ifTrue:[ |f|
			f := e findEventWithAnOppositeRateIn: events.
			(f actions) addAll: e actions]
		 ifFalse:[ events add:e]
		].
	].
^events