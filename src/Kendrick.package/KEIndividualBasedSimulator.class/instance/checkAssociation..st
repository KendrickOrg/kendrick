private
checkAssociation: as
	|dict|
	dict := as from.
	(model attributes keys at: #species)
		ifPresent: [ ^ true ].
	dict keys size <= 1
		ifTrue: [ ^ false ].
	(dict keys at: 2) = #species
		ifTrue: [ ^ true ].
	^ false