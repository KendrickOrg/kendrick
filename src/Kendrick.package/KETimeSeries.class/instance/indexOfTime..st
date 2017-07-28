accessing
indexOfTime: time
	^ index indexOf: time ifAbsent: [ 
		1 to: index size do: [ :i| 
			(index at: i) > time ifTrue: [ ^ i ]
			]
		 ]