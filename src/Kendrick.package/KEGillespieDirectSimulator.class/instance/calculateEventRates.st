as yet unclassified
calculateEventRates
	|cityRates i|
	cityRates := Array new: (model PIDList size).
	i := 1.
	model PIDList do: [ :aPID|
		|rates|
		model setPID: aPID.
		aPID isArray ifTrue: [ model setIndex: (aPID last) ].
		rates := OrderedCollection new.
		self eventList do: [ :each|
			rates add: (each evaluateWithModel: model).
			 ].
		self movementEventList ifNotNil: [ 
			(self movementEventList at: aPID) do: [ :each|
				rates add: (each evaluateWithModel: model)
				 ]
			 ].
		(model population at: aPID) rates: rates.
		cityRates at: i put: (rates sum).
		i := i + 1
		 ].
	^ cityRates