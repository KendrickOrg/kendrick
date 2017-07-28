as yet unclassified
pathLookUpFor: anId
	
	|inDisk|
	
	inDisk := (self entityFilesDir: self currentProjectDir) / self asString / (anId asString , '.kendrick'). "currentProject"
	[^ self entityExistsIn: inDisk] 
		on: NotFoundError
		do: [  
			inDisk := self entityFilesDir / self asString / (anId asString , '.kendrick'). "library"
			^ self entityExistsIn: inDisk.
		]
			