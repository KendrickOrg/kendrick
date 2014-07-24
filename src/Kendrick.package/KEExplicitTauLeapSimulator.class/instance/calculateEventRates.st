as yet unclassified
calculateEventRates
	model populationIDs do: [ :pid|
		(model population at: pid) rates: (OrderedCollection new)
		 ].
	self rtImpls do: [ :impl|
		|rates|
		rates := impl calculateEventRates.
		model populationIDs do: [ :pid|
			(model population at: pid) rates addAll: (rates at: pid)
			 ]
		 ]
	
	