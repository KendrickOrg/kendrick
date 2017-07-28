accessing
atAttribute: aSymbol
	^ attributes at: aSymbol ifAbsent: [ nil ]