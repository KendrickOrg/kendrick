as yet unclassified
addCompositeParameterWithTwoAttributes: variablePlusAttributes value: value

	|entities entityForSecond entityForThird |
	
	entityForSecond := (self entitiesFor: {variablePlusAttributes second}) first first.
	entityForThird := (self entitiesFor: {variablePlusAttributes third}) first first. 

	backEndEntity 
        addParameter: variablePlusAttributes first asSymbol
        value: [ :aModel| |c1 c2 index1 index2| 
			c1 := aModel currentCompartment at: variablePlusAttributes second.
			variablePlusAttributes last asSymbol = 'next' 
				ifFalse: [c2 := aModel currentCompartment at: variablePlusAttributes third]
				ifTrue: [c2 := aModel nextCompartment at: variablePlusAttributes third].
			index1 := (entityForSecond attributes at: variablePlusAttributes second) indexOf: c1.
			index2 := (entityForThird attributes at: variablePlusAttributes third) indexOf: c2.
			(value at: index1) at: index2.
	 ].

