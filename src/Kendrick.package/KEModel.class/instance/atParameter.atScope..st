as yet unclassified
atParameter: aSymbol atScope: scope
	|p tmp|
	"scope = #population ifTrue: [ p := (parameters at: scope ifAbsent: [ Dictionary new ]) at: aSymbol ifAbsent: [nil] ]."
	scope = #population 
	ifTrue: [ p := parameters at: aSymbol ifAbsent: [nil] ]
	ifFalse: [ 
		scope isDictionary ifTrue: [ tmp := scope associations ] ifFalse: [ tmp := scope ].
		parameters keysDo: [ :k|
			(tmp includes: k) ifTrue: [ p := (parameters at: k) at: aSymbol ifAbsent: [ nil ] ]
		]
	].
	p ifNotNil: [ ^ p value: self ].
	^ nil
	