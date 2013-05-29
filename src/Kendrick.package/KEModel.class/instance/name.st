as yet unclassified
name 
	 |stream|
	stream := WriteStream on: (String new: 60).
	compartments do: [ :each | 
		stream nextPutAll: each status		
		 ].
	^stream contents	