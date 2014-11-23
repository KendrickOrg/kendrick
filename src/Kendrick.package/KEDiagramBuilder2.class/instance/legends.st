as yet unclassified
legends
	((data isNotNil) and: [ data isDictionary ]) ifTrue: [ 
		legends := OrderedCollection new.
		data keys do: [ :k|
			|str|
			str := ''.
			k keysAndValuesDo: [ :k1 :v1|
				str := k1 asString, ': ', v1 asString, ',' 
				 ].
			str := str copyFrom: 1 to: (str size - 1).
			legends add: str 
			 ]
		 ].
	^ legends