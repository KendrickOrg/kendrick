as yet unclassified
findInterEvents: eventList
	interEvents := OrderedCollection new.
	eventList do: [ :each|
		(each fromStatus = variable symbol) | (each toStatus = variable symbol) ifTrue: [ interEvents add: each ]
		 ]