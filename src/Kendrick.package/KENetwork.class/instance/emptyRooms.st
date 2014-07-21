accessing
emptyRooms
	emptyRooms ifNil: [ emptyRooms := OrderedCollection new ].
	^ emptyRooms