as yet unclassified
addParameter: aSymbol inScope: association value: input
	|expression|
	input isNumber 
	ifTrue: [ expression := KENumerical new number: input ]
	ifFalse: [ expression := input ].
	parameters at: association ifAbsentPut: (Dictionary new).
	(parameters at: association) at: aSymbol put: (KEParameter new symbol: aSymbol; expression: expression) 