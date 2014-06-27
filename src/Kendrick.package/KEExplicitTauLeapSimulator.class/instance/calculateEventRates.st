as yet unclassified
calculateEventRates
	model PIDList do: [ :pid|
		(model population at: pid) rates: (OrderedCollection new)
		 ].
	self rtImpls do: [ :impl|
		|rates|
		rates := impl calculateEventRates.
		model PIDList do: [ :pid|
			(model population at: pid) rates addAll: (rates at: pid)
			 ]
		 ]
	
	