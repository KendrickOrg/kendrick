as yet unclassified
name 
	|name|
	name := WriteStream on: (String new: 60 ).
	compartmentSymbols keysAndValuesDo: [ :key :value|
		name nextPutAll: (key asString).
		 ].
	^ name contents