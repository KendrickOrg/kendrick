private
checkAssociation: as
	|dict|
	dict := as key from.
	model attributes at: #species
		ifAbsent: [ ^ true ].
	dict keys size <= 1
		ifTrue: [ ^ false ].
	(dict keys at: 2) = #species
		ifTrue: [ ^ true ].
	^ false