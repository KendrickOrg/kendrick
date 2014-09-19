as yet unclassified
generateEvents
	"This function will get all events generated from the current equation and depending on the sign of rate expression, create actions for each event"
	|eventList|
	eventList := expression generateEvents.
	eventList do: [ :each|
		(each rate sign positive)
		ifTrue: [ 
			each addOneIndividualTo: (variable symbol).
			each toStatus: (variable symbol) ]
		ifFalse: [ 
			each removeOneIndividualFrom: (variable symbol).
			each fromStatus: (variable symbol) ]
		 ].
	^ eventList
