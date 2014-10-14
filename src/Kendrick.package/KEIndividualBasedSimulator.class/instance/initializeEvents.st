as yet unclassified
initializeEvents
	super initializeEvents.
	birthEvents := Dictionary new.
	model subPopulations do: [ :each|
		|eventDict|
		"pid isNumber ifTrue: [ pid := Array with: pid ]."
		birthEvents at: each name put: OrderedCollection new.
		eventDict := Dictionary new.
		each events do: [ :event|
			event fromStatus = #empty ifTrue: [ (birthEvents at: (each name)) add: event ].
			((event fromStatus ~= #empty) & (event toStatus ~= each name)) ifTrue: [ 
				eventDict at: (event key) ifAbsentPut: (OrderedCollection new).
				(eventDict at: (event key)) add: event
				 ]
			 ].
		each events: eventDict 
		 ]
	