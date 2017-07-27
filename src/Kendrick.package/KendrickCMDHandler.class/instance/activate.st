as yet unclassified
activate
	| tmp1 tmp2 tmp3 |
	self activateHelp.
	self arguments
		ifEmpty: [ ^ self error: '[KENDRICK] No input file defined' ].
	tmp1 := self arguments first asFileReference.
	KendrickInternalDSLEntities
		currentProjectDir: tmp1 projectNameForKendrick.
	tmp1 exists
		ifTrue: [ tmp2 := tmp1 readStream.
			tmp3 := Compiler evaluate: tmp2 upToEnd.
			tmp2 close ]
		ifFalse: [ ^ self
				error: '[KENDRICK] No such file or directory: ' , tmp1 asString ].
	self quit