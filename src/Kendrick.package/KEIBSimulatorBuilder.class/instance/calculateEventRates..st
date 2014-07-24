as yet unclassified
calculateEventRates: events
	|rates "currentPID"|
	"currentPID := model getPID."
	rates := Dictionary new.
	model populationIDs do: [ :pid| rates at: pid put: (Dictionary new) ].
	model populationIDs do: [ :pid|
		model setPID: pid.
		pid isArray ifTrue: [ model setIndex: (pid last) ].
		events keysAndValuesDo: [ :symbol :list|
			(rates at: pid) at: symbol put: (OrderedCollection new).
			list do: [ :each|
				each isCouplingEvent
				ifTrue: [ ((rates at: pid) at: symbol) add: -1 ]
				ifFalse: [ |r|
					each fromStatus = #empty ifTrue: [ each rate: (each rate remove: (KEVariable new symbol: #N)) ].
					r := each evaluateWithModel: model.
					((rates at: pid) at: symbol) add: r
					 ]
				 ] 
			 ]
		 ].
	"model setPID: currentPID.
	currentPID isArray ifTrue: [ model setIndex: (currentPID last) ]."
	^ rates