as yet unclassified
pathLookUpFor: arg1
	| tmp2 |
	tmp2 := (self entityFilesDir: self currentProjectDir) / self asString
		/ (arg1 asString , '.kendrick').
	[ ^ self entityExistsIn: tmp2 ]
		on: NotFoundError
		do: [ tmp2 := self entityFilesDir / self asString
				/ (arg1 asString , '.kendrick').
			^ self entityExistsIn: tmp2 ]