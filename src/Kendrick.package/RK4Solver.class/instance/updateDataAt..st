as yet unclassified
updateDataAt: j
	1 to: (data size) do: [ :i|
		(data at: i) at: j put: (y at: i)
		 ]