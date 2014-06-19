as yet unclassified
calEventRates
	|currentPID|
	currentPID := model getPID.
	eventRates := Dictionary new.
	model PIDList do: [ :pid| |eRates|
		model setPID: pid.
		pid isArray ifTrue: [ model setIndex: (pid last) ].
		eRates := Dictionary new.
		self eventList keysAndValuesDo: [ :key :events|
			eRates at: key put: (OrderedCollection new).
			events do: [ :event|
				event hasInterPopInteraction 
				ifTrue: [ (eRates at: key) add: -1 ]
				ifFalse: [ 
					|r|
					event fromStatus = #empty ifTrue: [ 
					event rate: (event rate remove: (KEVariable new symbol: #N))
					 ].
					r := event evaluateIntraPopInteractionWithModel: model.
					(eRates at: key) add: r
				 ]
			 ]
		 ].
		eventRates at: pid put: eRates
	].
	model setPID: currentPID.
	currentPID isArray ifTrue: [ model setIndex: (currentPID last) ].
	^ eventRates