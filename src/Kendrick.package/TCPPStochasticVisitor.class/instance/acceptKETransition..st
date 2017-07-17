as yet unclassified
acceptKETransition: aTransitionNode 
	"Not yet finished"
	|aStream string1 fromStatus toStatus|
	string1 := ''.
	aStream := WriteStream on: (String new: 60).
	"aTransitionNode eqIndexVar ifNotNil: [ eventIndex := (aTransitionNode eqIndex) - 1 ].	"
	string1 := String tab, string1, 'rates[', (numberOfEvent asString), '] = '.
	string1 := string1, (self visitNode: aTransitionNode rate), ';'.
	strInitializeKEMath ifNotNil: [ 
		aStream nextPutAll: (strInitializeKEMath contents).
		strInitializeKEMath := nil.
		 ].		
	fromStatus := ''.
	aTransitionNode fromStatus ifNotNil: [ fromStatus := aTransitionNode fromStatus symbol asString ].
	toStatus := ''.
	aTransitionNode toStatus ifNotNil: [ toStatus := aTransitionNode toStatus symbol asString. ].		
	strInitializeTrans nextPutAll: String tab, 'listOfTransitions[', (numberOfEvent asString), '].fromStatus = "', fromStatus, '";';cr.
	strInitializeTrans nextPutAll: String tab, 'listOfTransitions[', (numberOfEvent asString), '].toStatus = "', toStatus, '";';cr.
	strInitializeTrans nextPutAll: String tab, 'listOfTransitions[', (numberOfEvent asString), '].specieID = ', aTransitionNode eqIndex asString, ';';cr.
	
	numberOfEvent := numberOfEvent + 1.
	eventIndex := -1.	
	aStream nextPutAll: string1;cr.
	^ aStream contents