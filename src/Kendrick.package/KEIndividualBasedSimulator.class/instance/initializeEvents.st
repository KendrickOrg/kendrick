as yet unclassified
initializeEvents
	super initializeEvents.
	birthEvents := Dictionary new.
	"change the way storing the list of events of individual-based simulation, using a Dictionary insteading of OrderedCollection"
	model subPopulations do: [ :each|
		|eventDict|
		"birthEvents at: each name put: OrderedCollection new."
		eventDict := Dictionary new.
		each events do: [ :event|
			event fromStatus = #empty ifTrue: [ birthEvents at: (each name) put: event ].
			
			((event fromStatus ~= #empty) & (event toStatus ~= each)) ifTrue: [ 
				eventDict at: (event key) ifAbsentPut: (OrderedCollection new).
				(eventDict at: (event key)) add: event
				 ]
			 ].
		each events: eventDict 
		 ]
	