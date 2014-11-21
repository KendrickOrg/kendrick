as yet unclassified
atParameter: anObject
	|key param|
	test ifTrue: [ 
		|x pop|
	pop := self currentSubPopulation.
	pop ifNotNil: [
		x := pop atParameter: anObject
		].
	x ifNil: [ 
		x := parameters at: anObject ifAbsent: [^ nil].
		x ifNil: [ ^ nil ].
		x expression 
		ifNotNil: [ 
			x evaluateWithModel: self
		 	]
		 ].
	^ x value
		 ].
	"----------------------------------------------------------------------------"
	anObject isSymbol
	ifFalse: [ 
		|reader|
		(reader := STONReader on: anObject readStream) allowComplexMapKeys: true.
		key := reader next
		 ]
	ifTrue: [ key := anObject ].
	^ parameters at: key ifAbsent: [ 
		param := parameters at: (key keys first) ifAbsent:
			[ ^ self error: 'No parameter at: ', anObject asString ].
		param ifNotNil: [ ^ param at: (key values first) ]		
		 ]
	
	