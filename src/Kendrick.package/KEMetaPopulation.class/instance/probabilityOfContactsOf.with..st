accessing
probabilityOfContactsOf: source with: destination
	|firstContactLevel|
	graphs first isContactNetwork 
	ifTrue: [ firstContactLevel := 1 ] 
	ifFalse: [ firstContactLevel := 2 ].

	^ self processLevel: firstContactLevel sourceNode: source destinationNode: destination

	