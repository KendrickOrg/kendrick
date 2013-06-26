as yet unclassified
acceptKETransition: aTransitionNode 
	|aStream string1|
	string1 := ''.
	aStream := WriteStream on: (String new: 60).
	string1 := String tab, string1, 'rates[', (numberOfEvent asString), '] = '.
	string1 := string1, (self visitNode: aTransitionNode rate), ';'.
	
	streamOfTransaction nextPutAll: String tab, 'listOfTransitions[', (numberOfEvent asString), '].fromStatus = "', aTransitionNode fromStatus asString, '";';cr.
	streamOfTransaction nextPutAll: String tab, 'listOfTransitions[', (numberOfEvent asString), '].toStatus = "', aTransitionNode toStatus asString, '";';cr.
	streamOfTransaction nextPutAll: String tab, 'listOfTransitions[', (numberOfEvent asString), '].specieID = ', aTransitionNode eqIndex asString, ';';cr.
	numberOfEvent := numberOfEvent + 1.
	aStream nextPutAll: string1;cr.
	^ aStream contents