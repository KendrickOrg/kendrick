accessing
buildData: result with: timeSeries
	|i|
	i := 1.
	data := Dictionary new.
	model populationIDs = #(0) 
	ifTrue: [ 
		model equations do: [ :eq|
			data at: (eq variable symbol) put: (KETimeSeries from: (result at: i) withIndex: timeSeries).
			i := i + 1.
			 ].
		 ]
	ifFalse: [ 
		model populationIDs do: [ :aPid|
			data at: aPid put: (Dictionary new).
			model equations do: [ :eq|
				(data at: aPid) at: (eq variable symbol) put: (KETimeSeries from: (result at: i) withIndex: timeSeries).
				i := i + 1.
				 ]
			 ]
		 ]