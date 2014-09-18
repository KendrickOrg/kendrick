as yet unclassified
adapters
	adapters ifNil: [ |eventAdapter|
		adapters := OrderedCollection new.
		eventAdapter := KEEventAdapter new.
		eventAdapter atArgument: #simulator put: self.
		adapters add: eventAdapter
		 ].
	^ adapters