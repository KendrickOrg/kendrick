as yet unclassified
name 
	|name|
	name := WriteStream on: (String new: 60 ).
	(population attributes at: #status) do: [ :key|
		name nextPutAll: key asString.
		 ].
	^ name contents