as yet unclassified
findEventHasInterPopInteraction: eventList
	interPopInteractionEvents := OrderedCollection new.
	eventList do: [ :each|
		(each fromStatus = variable symbol) | (each toStatus = variable symbol) ifTrue: [ interPopInteractionEvents add: each ]
		 ]