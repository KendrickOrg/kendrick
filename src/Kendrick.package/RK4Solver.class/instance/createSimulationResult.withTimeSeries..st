as yet unclassified
createSimulationResult: aModel withTimeSeries: timeSeries
	|result i|
	result := Dictionary new.
	i := 1.
	aModel PIDList = #(0) ifTrue: [ 
		aModel equations do: [ :eq|
			result at: (eq variable symbol) put: (KETimeSeries from: (data at: i) withIndex: timeSeries).
			i := i+1.
			 ].
		^ result
		 ].
	aModel PIDList do: [ :each|
		result at: each put: (Dictionary new).
		aModel equations do: [ :eq|
			(result at: each) at: (eq variable symbol) put: (KETimeSeries from: (data at: i) withIndex: timeSeries).
			i := i+1.
			 ]
		 ].
	^ result