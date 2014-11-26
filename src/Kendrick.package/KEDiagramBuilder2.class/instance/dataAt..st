as yet unclassified
dataAt: key
	data isDictionary ifTrue: [ 
		data keysAndValuesDo: [ :k :v|
			(k isDictionary and: [ k values includes: key ]) ifTrue: [ ^ v ]
			 ]
		 ].
	^ self error: 'Do not found key: ', key asString, 'in data collection'.