as yet unclassified
dataAt: key
	data do: [ :e|
		(e key isDictionary and: [ e key values includes: key ]) ifTrue: 
			[ ^ e value ]
			 ].
	^ self error: 'Do not found key: ', key asString, 'in data collection'.