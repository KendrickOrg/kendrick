as yet unclassified
addParameter: aSymbol inScope: associations value: input
	|tmp|
	associations isArray ifFalse: [ tmp := Array with: associations ] ifTrue: [ tmp := associations ].
	parameters at: (Dictionary newFrom: tmp) ifAbsentPut: (Dictionary new).
	(parameters at: (Dictionary newFrom: tmp)) at: aSymbol put: input 