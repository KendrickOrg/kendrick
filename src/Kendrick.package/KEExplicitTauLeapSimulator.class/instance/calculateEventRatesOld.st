as yet unclassified
calculateEventRatesOld
	|movementRates|
	movementRates := OrderedCollection new.
	model PIDList do: [ :aPID|
		|rates|
		model setPID: aPID.
		aPID isArray ifTrue: [ model setIndex: (aPID last) ].
		rates := OrderedCollection new.
		self eventList do: [ :each| |r|
			r := (each evaluateWithModel: model).
			each fromStatus ~= #empty ifTrue: [ 
				r := r * ((model population at: (model getPID)) at: (each fromStatus asSymbol)) currentNbIndividuals
				 ].
			rates add: r
			 ].
		(model population at: aPID) rates: rates
		 ].
	self movementEventList ifNotNil: [ 
		(self movementEventList) do: [ :each|
			movementRates add: (each evaluateWithModel: model)
			 ]
		 ].
	^ movementRates
	
	