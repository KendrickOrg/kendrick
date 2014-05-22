as yet unclassified
hasWeight: aSymbol
	weightNames do: [ :each| each = aSymbol ifTrue: [ ^ true ] ].
	^ false