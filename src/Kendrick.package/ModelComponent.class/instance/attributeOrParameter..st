protected
attributeOrParameter: aName

	^ (parameters keys includes: aName)
		ifTrue: [ backEndEntity atParameter: aName ]
		ifFalse: [  
			|assoc|
			assoc := (attributes associations select: [ :as | as value includes: aName ]).
			assoc isEmpty 
				ifTrue: [ 
					(aName asString includes: $_)
							ifTrue: [ |tokens c|
								tokens := aName findTokens: '_'.
								(attributes keys includes: tokens first)
									ifFalse: [  
										c := backEndEntity currentCompartment at: tokens second.
										assoc := (attributes associations select: [ :as | as value includes: tokens first ]).
										backEndEntity atCompartment: { assoc first key -> tokens first asSymbol . tokens second -> c } 
									] ifTrue: [  
										backEndEntity sizeOfPopulation: (tokens collect: [:t | (backEndEntity currentCompartment at: t)]) asArray.
									]
							]
							ifFalse: [backEndEntity sizeOfPopulation: (backEndEntity currentCompartment at: aName asSymbol)] 
				] "assume attribute name"
				ifFalse: [
								backEndEntity atCompartment: { assoc first key -> aName }
				]
		]
	