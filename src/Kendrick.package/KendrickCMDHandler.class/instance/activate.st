as yet unclassified
activate
	|inDisk|
	
	self activateHelp.
	self arguments ifEmpty: [ ^ self error: '[KENDRICK] No input file defined' ].
	inDisk := self class entityFilesDir / self arguments first.
			inDisk exists 	
				ifTrue: [ 
					|rs entity|
					rs :=  inDisk readStream. 
					entity := Compiler evaluate: rs upToEnd.
					rs close.  
					entity
				] ifFalse: [ ^ self error: '[KENDRICK] No such file or directory: ' , inDisk asString ].
	self quit.
			