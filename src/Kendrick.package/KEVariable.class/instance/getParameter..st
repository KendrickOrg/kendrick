printing
getParameter: aDictionary
	|p|
	p := aDictionary at: symbol ifAbsent: [ ^ nil ].
	p ifNil: [ ^ nil ].
	p ifNotNil: [ ^ p symbol ]