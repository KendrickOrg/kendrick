accessing
buildData: result with: timeSeries
	|i|
	i := 1.
	data := Dictionary new.
	model subPopulations size = 1 
	ifTrue: [
		model equations do: [ :eq|
			data at: (eq variable symbol) put: (KETimeSeries from: (result at: i) withIndex: timeSeries).
			i := i + 1.
			 ].
		 ]
	ifFalse: [ 
		model subPopulations do: [ :pop|
			data at: (pop name) put: (Dictionary new).
			model equations do: [ :eq|
				(data at: pop name) at: (eq variable symbol) put: (KETimeSeries from: (result at: i) withIndex: timeSeries).
				i := i + 1.
				 ]
			 ]
		 ]