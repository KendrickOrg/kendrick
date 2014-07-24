as yet unclassified
calculateEventRates
	"This function will be called for only one time before the main iteration of algorithm starts"
	model populationIDs do: [ :pid|
		(model population at: pid) rates: (Dictionary new)
		 ].
	self rtImpls do: [ :impl|
		|rates|
		rates := impl calculateEventRates.
		rates keysAndValuesDo: [ :pid :eDict|
			eDict keysAndValuesDo: [ :symbol :list|
				(model population at: pid) rates at: symbol ifAbsentPut: (OrderedCollection new).
				((model population at: pid) rates at: symbol) addAll: list
				 ].
			 ]
		 ]