as yet unclassified
calEventRates
	eventRates := Dictionary new.
	self eventList keysAndValuesDo: [ :key :events|
		eventRates at: key put: (OrderedCollection new).
		events do: [ :event|
			event hasInterPopInteraction 
			ifTrue: [ (eventRates at: key) add: -1 ]
			ifFalse: [ 
				|r|
				event fromStatus = #empty ifTrue: [ 
					event rate: (event rate remove: (KEVariable new symbol: #N))
					 ].
				r := event evaluateIntraPopInteractionWithModel: model.
				(eventRates at: key) add: r
				 ]
			 ]
		 ].
	self movementEventList ifNotNil: [ 
		self movementEventList keysAndValuesDo: [ :key : events|
		eventRates at: key put: (OrderedCollection new).
		events do: [ :each|
			(eventRates at: key) add: (each interRate number)
			 ]
		 ] 
	 ].
	^ eventRates