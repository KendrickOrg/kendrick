as yet unclassified
atParameter: aSymbol
	|p|
	p := (self parameters at: aSymbol ifAbsent: [ nil ]).
	p ifNotNil: [ ^ p value: self ].
	^ nil
	