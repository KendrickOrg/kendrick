as yet unclassified
movementEventList
	movementEventList ifNil: [ movementEventList := self generateMovementEvents ].
	^ movementEventList