as yet unclassified
atAttribute: aSymbol add: aValue
	|newDomain|
	attributes at: aSymbol ifAbsent: [ ^ self error: 'Cannot find attribute ', aSymbol asString ].
	newDomain := OrderedCollection new.
	newDomain addAll: (attributes at: aSymbol).
	newDomain add: aValue.
	attributes at: aSymbol put: newDomain