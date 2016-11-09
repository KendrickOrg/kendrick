as yet unclassified
"protocol: as yet unclassified"
withId: anId
	
	|inImage inDisk|

	inImage := (self storedInstances select: [ :instance | instance id = anId ]).
	inImage isEmpty 	
		ifFalse: [ ^ inImage first ]
		ifTrue: [  
			^ self pathLookUpFor: anId
		]