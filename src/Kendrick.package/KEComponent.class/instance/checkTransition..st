private
checkTransition: tr
	"return true iff tr has one key is species"

	| dict |
	dict := tr from.
	self attributes keys size <= 1
		ifTrue: [ ^ true ].
	dict keys size <= 1
		ifTrue: [ ^ false ].
	(dict keys at: 2) = #species
		ifTrue: [ ^ true ].
	^ false