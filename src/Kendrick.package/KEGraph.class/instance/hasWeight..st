as yet unclassified
hasWeight: aSymbol
	self weightNames do: [ :each| each = aSymbol ifTrue: [ ^ true ] ].
	^ false