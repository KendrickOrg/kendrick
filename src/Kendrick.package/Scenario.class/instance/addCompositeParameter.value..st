as yet unclassified
addCompositeParameter: variablePlusAttributes value: value

	|entities entity |

	"should be generilized"
	
	entities := self entitiesFor: variablePlusAttributes allButFirst.
	
	"Refactor this one ..."
	
	parameters at: variablePlusAttributes put: value.
	
	((variablePlusAttributes size >= 3) and: [ entities second isEmpty ])
		ifTrue: [ ^ self addCompositeParameterWithTwoAttributes: variablePlusAttributes value: value ].

	
	backEndEntity 
        addParameter: variablePlusAttributes first asSymbol
        value: 
        [ :aModel| |c index attrEnt compEnt|
				attrEnt := entities first first. "for now suppose you have one of each"
				compEnt := entities second. "or only attributes"
            c := aModel currentCompartment at: variablePlusAttributes second.
				index := (attrEnt attributes at: variablePlusAttributes second) indexOf: c.            
				compEnt isEmpty
					ifTrue: [value at: index]
					ifFalse: [  
						c := aModel currentCompartment at: compEnt first attributes keys first. "should pick the right attr here"
						c = variablePlusAttributes last 
							ifTrue: [ value last ]
							ifFalse: [ 
								value at: index.
							]
					]  
        ].

