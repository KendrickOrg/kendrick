as yet unclassified
calculateEventRates
	|cityRates i|
	cityRates := Array new: (model populationIDs size).
	i := 1.
	model populationIDs do: [ :pid|
		(model population at: pid) rates: (OrderedCollection new)
		 ].
	self runtimeAdapters do: [ :adapter|
		|rates|
		rates := adapter calculateEventRates.
		model populationIDs do: [ :pid|
			(model population at: pid) rates addAll: (rates at: pid)
			 ]
		 ].
	model populationIDs do: [ :aPID|
		cityRates at: i put: ((model population at: aPID) rates sum).
		i := i + 1
		 ].
	^ cityRates
	