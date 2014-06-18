as yet unclassified
name 
	|name|
	name := WriteStream on: (String new: 60 ).
	compartments do: [ :each|
		name nextPutAll: (each status asString).
		 ].
	^ name contents