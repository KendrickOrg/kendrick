as yet unclassified
calculateEventRatesOld
	|cityRates i|
	cityRates := Array new: (model PIDList size).
	i := 1.
	model PIDList do: [ :aPID|
		|rates|
		rates := OrderedCollection new.
		model setPID: aPID.
		aPID isArray ifTrue: [ model setIndex: (aPID last) ].
		rates := OrderedCollection new.
		self eventList do: [ :each|
			|r|
			r := (each evaluateWithModel: model).
			each fromStatus ~= #empty ifTrue: [ 
				r := r * ((model population at: (model getPID)) at: (each fromStatus asSymbol)) currentNbIndividuals
				 ].
			rates add: r
			 ].
		self movementEventList ifNotNil: [ 
			(self movementEventList at: aPID) do: [ :each|
				rates add: (each evaluateWithModel: model)
				 ]
			 ].
		(model population at: aPID) rates: rates.
		cityRates at: i put: (rates sum).
		cityRates at: i put: (model population at: aPID) rates sum.
		i := i + 1
		 ].
	^ cityRates