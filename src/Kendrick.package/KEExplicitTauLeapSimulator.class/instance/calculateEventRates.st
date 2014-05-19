as yet unclassified
calculateEventRates
	|movementRates|
	movementRates := OrderedCollection new.
	model PIDList do: [ :aPID|
		|rates|
		model setPID: aPID.
		aPID isArray ifTrue: [ model setIndex: (aPID last) ].
		rates := OrderedCollection new.
		self eventList do: [ :each|
			rates add: (each evaluateWithModel: model)
			 ].
		(model population at: aPID) rates: rates
		 ].
	self movementEventList ifNotNil: [ 
		(self movementEventList) do: [ :each|
			movementRates add: (each evaluateWithModel: model)
			 ]
		 ].
	^ movementRates
	
	