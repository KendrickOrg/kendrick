as yet unclassified 
checkEnoughKeys: tr
	"return true iff transition named tr has all keys like attributes of model"

	| dict |
	dict := tr from.
	model attributes keys size <= 1
		ifTrue: [ ^ true ].
	dict keys size <= 1
		ifTrue: [ ^ false ].
	dict keys size = model attributes keys size
		ifTrue: [ ^ true ].
	^ false