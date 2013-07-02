as yet unclassified
acceptKEEQuation: aNode
	|aStream strTmp|
	aStream := WriteStream on: (String new: 60).
	strTmp := WriteStream on: (String new: 60).
	strTmp nextPutAll: (self visitNode: aNode expression).
	equaChecks at: (aNode variable symbol) ifAbsent: [ 
		equaChecks at: (aNode variable symbol) put: 1.
		aStream nextPutAll: String tab, 'for (int i = 0; i < nbOfSpecies; i++)';cr.
		aStream nextPutAll: String tab, '{';cr.
		strInitializeKEMath ifNotNil: [ 
			aStream nextPutAll: (strInitializeKEMath contents).
			strInitializeKEMath := nil.
			].
		aStream nextPutAll: String tab, String tab, 'dxdt(', (compartments at: aNode variable symbol) asString, ', i) = '.
		aStream nextPutAll: strTmp contents, ';';cr.
		aStream nextPutAll: String tab, '}';cr.
		 ].
	^ aStream contents