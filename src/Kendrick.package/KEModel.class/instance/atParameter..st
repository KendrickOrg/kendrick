as yet unclassified
atParameter: aSymbol
	|p|
	aSymbol = #t ifTrue: [ ^ parameters at: #t ifAbsent: [ 0 ] ].
	"inProcessingCompartment is a Dictionary = name of current processing compartment"
	aSymbol = #inProcessingCompartment ifTrue: [ ^ parameters at: #inProcessingCompartment ifAbsent: [#population] ].
	"aSymbol = #scope ifTrue: [ ^ parameters at: #scope ifAbsent: [ #population ] ]."
	"aSymbol = #individual ifTrue: [ ^ parameters at: #individual ]."
	aSymbol = lambda ifTrue: [ ^ self forceOfInfection ].
	"aSymbol = #contactingSource ifTrue: [ ^ parameters at: #contactingSource ifAbsent: [ nil ] ]."
	"p := (parameters at: (self atParameter: #scope) ifAbsent: [ Dictionary new ]) at: aSymbol ifAbsent: [ nil ]."
	"p := self atParameter: aSymbol atScope: (self atParameter: #scope)."
	p := self atParameter: aSymbol atScope: (self atParameter: #inProcessingCompartment).
	p ifNil: [ p := self atParameter: aSymbol atScope: #population ]. 
	^ p
	