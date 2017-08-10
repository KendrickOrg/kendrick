private
checkTransition: tr
	"return true iff tr has key is species"
	|dict|
	dict := tr from.
	((dict keys) size <= 1) ifTrue: [ ^false. ].
	((dict keys at: 2) = #species) ifTrue: [ ^true ].
	^false.