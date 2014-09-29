as yet unclassified
initializeEvents
	super initializeEvents.
	birthEvents := Dictionary new.
	model populationIDs do: [ :pid|
		|eventDict|
		pid isNumber ifTrue: [ pid := Array with: pid ].
		birthEvents at: pid put: OrderedCollection new.
		eventDict := Dictionary new.
		(model population at: pid) events do: [ :event|
			event fromStatus = #empty ifTrue: [ (birthEvents at: pid) add: event ].
			((event fromStatus ~= #empty) & (event toStatus ~= pid)) ifTrue: [ 
				eventDict at: (event key) ifAbsentPut: (OrderedCollection new).
				(eventDict at: (event key)) add: event
				 ]
			 ].
		(model population at: pid) events: eventDict 
		 ]
	