as yet unclassified
buildMovementEvents: events
	"For individual based simulator, the events is formulated as a dictionary: symbol(key1 = pid)-->OrderedCollection(event list), dont take account into the compartment because all individuals have the same movement events that depend on its pid not on its currentStatus"
	|eventDict symbol|
	eventDict := Dictionary new.
	symbol := model compartmentSymbols keys first.
	model populationIDs do: [ :pid|
		eventDict at: pid put: (OrderedCollection new)
		 ].
	events keysAndValuesDo: [ :pid :list| 
		(eventDict at: pid) addAll: (list select: [ :each| each compartment = symbol ])
		].
	^ eventDict
	