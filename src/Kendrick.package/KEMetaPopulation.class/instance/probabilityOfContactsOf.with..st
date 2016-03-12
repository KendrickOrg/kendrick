accessing
probabilityOfContactsOf: source with: destination
	| firstContactLevel |
	graphs first isCommutingNetwork
		ifTrue: [ ^ graphs first
				probabilityOfContactsOf: source
				with: destination
				inPopulation: self ].
	firstContactLevel := graphs first isContactNetwork
		ifTrue: [ 1 ]
		ifFalse: [ 2 ].
	^ self
		processLevel: firstContactLevel
		sourceNode: source
		destinationNode: destination