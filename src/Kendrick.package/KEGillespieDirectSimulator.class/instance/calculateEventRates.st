as yet unclassified
calculateEventRates
	|cityRates i|
	cityRates := Array new: (model PIDList size).
	i := 1.
	model PIDList do: [ :pid|
		(model population at: pid) rates: (OrderedCollection new)
		 ].
	self rtImpls do: [ :impl|
		|rates|
		rates := impl calculateEventRates.
		model PIDList do: [ :pid|
			(model population at: pid) rates addAll: (rates at: pid)
			 ]
		 ].
	model PIDList do: [ :aPID|
		cityRates at: i put: ((model population at: aPID) rates sum).
		i := i + 1
		 ].
	^ cityRates