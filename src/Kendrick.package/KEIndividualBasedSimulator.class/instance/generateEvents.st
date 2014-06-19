as yet unclassified
generateEvents
	|eventDict events|
	eventDict := Dictionary new.
	events := super generateEvents.
	events do: [ :each|
		|list|
		list := eventDict at: (each fromStatus) ifAbsentPut: (OrderedCollection new).
		list add: each
		 ].
	^ eventDict