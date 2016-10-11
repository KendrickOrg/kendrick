as yet unclassified
"protocol: as yet unclassified"
withId: anId
	
	|inImage inDisk|

	inImage := (self storedInstances select: [ :instance | instance id = anId ]).
	inImage isEmpty 	
		ifFalse: [ ^ inImage first ]
		ifTrue: [  
			inDisk := self entityFilesDir / self asString / (anId asString , '.kendrick').
			inDisk exists 	
				ifTrue: [ 
					|rs entity|
					rs :=  inDisk readStream. 
					entity := Compiler evaluate: rs upToEnd.
					rs close.  
					^ entity
				]
				ifFalse: [ Error signal: 'NO such entity: ' , anId asString ]	
		]