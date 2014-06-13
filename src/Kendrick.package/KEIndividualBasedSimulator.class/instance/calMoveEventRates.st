as yet unclassified
calMoveEventRates
	self movementEventList ifNotNil: [ 
		moveRates := Dictionary new.
		self movementEventList keysAndValuesDo: [ :key : events|
		moveRates at: key put: (OrderedCollection new).
		events do: [ :each|
			(moveRates at: key) add: (each interRate number)
			 ]
		 ] 
	 ].
	^ moveRates