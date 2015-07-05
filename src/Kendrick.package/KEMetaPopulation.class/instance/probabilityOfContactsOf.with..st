accessing
probabilityOfContactsOf: source with: destination
	|firstContactLevel|
	graphs first isCommutingNetwork
	ifTrue: [ 
		^ graphs first probabilityOfContactsOf: source with: destination inPopulation: self
		 ].
	graphs first isContactNetwork 
	ifTrue: [ firstContactLevel := 1 ] 
	ifFalse: [ firstContactLevel := 2 ].
	^ self processLevel: firstContactLevel sourceNode: source destinationNode: destination
	

	