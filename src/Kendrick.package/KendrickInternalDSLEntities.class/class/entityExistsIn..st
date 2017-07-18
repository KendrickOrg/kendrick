as yet unclassified
"protocol: as yet unclassified"
entityExistsIn: path
	
	path exists 	
				ifTrue: [ 
					|rs entity|
					rs :=  path readStream. 
					entity := Compiler evaluate: rs upToEnd.
					rs close.  
					^ entity
				]
				ifFalse: [ NotFoundError signal: 'NO such entity: ' , path asString ]	
			