as yet unclassified
findCouplingEvents: eventList
	couplingEvents := OrderedCollection new.
	eventList do: [ :each|
		(each fromStatus = variable symbol) | (each toStatus = variable symbol) ifTrue: [ couplingEvents add: each ]
		 ]