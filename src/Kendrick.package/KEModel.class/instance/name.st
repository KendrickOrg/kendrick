as yet unclassified
name 
	|name|
	name := WriteStream on: (String new: 60 ).
	compartmentSymbols keysDo: [ :key|
		name nextPutAll: (key asString).
		 ].
	^ name contents