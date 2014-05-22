as yet unclassified
eventList
	eventList ifNil: [ eventList := self generateEvents ].
	^ eventList