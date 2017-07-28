operators
addStatus: anArrayOfSymbol
	anArrayOfSymbol do: [ :aSymbol| self atAttribute: #status add: aSymbol ]
	