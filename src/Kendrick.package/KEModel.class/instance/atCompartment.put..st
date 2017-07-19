as yet unclassified
atCompartment: keyInput put: number
	|key total| "new temporary variable(s): total, added by ThanhNT 18/7"
	((keyInput isDictionary) | (keyInput isSymbol)) ifTrue: [ key := keyInput ].
	keyInput isArray ifTrue: [ key := Dictionary newFrom: keyInput ].
	keyInput isString ifTrue: [ key := ((STONReader on: keyInput readStream) allowComplexMapKeys: true) next ].
	self initCompartments at: key ifAbsent: [ 
		(self compartmentNames includes: key) ifFalse: [ ^ self error: 'No compartment names: ', key asString ].
		initCompartments := Dictionary newFrom: (self compartmentNames collect: [:c| c->0]).
		 ].
	"ThanhNT 18/7"
	"Reason: Handle the case number is an array"
	total := 0.
	number isArray ifTrue: [ total := self sumAllElements: number ]
		ifFalse: [ total := number ].
	total := total + (self sumAllElements: (initCompartments values)).	
	(population initialSize < (total)) ifTrue: [ ^ self error: 'Total size of compartments is greater than the population size' ].
	"(population initialSize < (initCompartments values sum + number)) ifTrue: [ ^ self error: 'Total size of compartments is greater than the population size' ]."
	"Endof ThanhNT 18/7"
	initCompartments at: key put: number.
	population compartments: initCompartments
	