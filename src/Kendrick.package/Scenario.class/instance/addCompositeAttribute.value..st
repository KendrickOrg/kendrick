as yet unclassified
addCompositeAttribute: variablePlusAttributes value: value

	compartments at: variablePlusAttributes put: value.
	(self allCompositeReferencesFor: variablePlusAttributes)
		doWithIndex: [:ref :index|  
			(value anySatisfy: [ :item | item isCollection ])
				ifTrue: [ backEndEntity atCompartment: ref put: (value flatten at: index) ]
				ifFalse: [ backEndEntity atCompartment: ref put: (value at: index) ]		
		]