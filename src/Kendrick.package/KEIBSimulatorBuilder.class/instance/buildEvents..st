as yet unclassified
buildEvents: events
	"For Individual Based simulator, events represented as a Dictionary: symbol(key)-->OrderedCollection (event list), that help easily processing for each individual"
	|eventDict|
	eventDict := Dictionary new.
	events do: [ :each|
		|list|
		list := eventDict at: (each fromStatus) ifAbsentPut: (OrderedCollection new).
		list add: each
		 ].
	^ eventDict