as yet unclassified
doTauLeapIteration
	self calculateEventRates.
	model PIDList do: [ :pid|
		|rates|
		rates := (model population at: pid) rates.
		1 to: (rates size) do: [ :i|
			|num|
			num := self poissrnd: (rates at: i).
			self executeEvent: i in: pid  times: num.
			 ]
		 ]
	