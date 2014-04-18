accessing
atCompartment: aSymbol
	status = aSymbol ifTrue: [ ^ self ].
	^ nil
	