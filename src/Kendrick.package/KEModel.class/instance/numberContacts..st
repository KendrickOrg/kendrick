as yet unclassified
numberContacts: anArrayOfAssociations
	|s reader d|
	s := self atParameter: #inProcessingCompartment.
	anArrayOfAssociations isString 
	ifTrue: [ 
		(reader := STONReader on: anArrayOfAssociations readStream) allowComplexMapKeys: true.
		d := (reader next) associations
		 ]
	ifFalse: [ d := anArrayOfAssociations ].
	
	^ population probabilityOfContactsOf: s with: d