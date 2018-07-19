Class {
	#name : #Scenario,
	#superclass : #KendrickModelingComponent,
	#instVars : [
		'model',
		'concerns',
		'compartments',
		'composition'
	],
	#category : 'Kendrick-InternalDSL'
}

{ #category : #'as yet unclassified' }
Scenario >> addCompositeAtrributeOrParameter: variable value: value [

	|variablePlusAttributes|
	
	variablePlusAttributes := variable asString findTokens: '_'.
	"assume single attribute for the time being"
	
	(model attributeValuesIncludes: variablePlusAttributes first asSymbol)
		ifTrue: [ 
			self addCompositeAttribute: variablePlusAttributes value: value. 
		] ifFalse: [  
		(model parameters keys includes: variablePlusAttributes first asSymbol)
			ifTrue: [  
				self addCompositeParameter: variablePlusAttributes value: value.
			] ifFalse: [ 
					KendrickDSLSyntaxError 
								signal: 'Undefined Variable Being Set: ' , variable asString ]. 
		].
	
]

{ #category : #'as yet unclassified' }
Scenario >> addCompositeAttribute: variablePlusAttributes value: value [

	compartments at: variablePlusAttributes put: value.
	(self allCompositeReferencesFor: variablePlusAttributes)
		doWithIndex: [:ref :index|  
			(value anySatisfy: [ :item | item isCollection ])
				ifTrue: [ backEndEntity atCompartment: ref put: (value flatten at: index) ]
				ifFalse: [ backEndEntity atCompartment: ref put: (value at: index) ]		
		]
]

{ #category : #'as yet unclassified' }
Scenario >> addCompositeParameter: variablePlusAttributes value: value [

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


]

{ #category : #'as yet unclassified' }
Scenario >> addCompositeParameterWithTwoAttributes: variablePlusAttributes value: value [

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


]

{ #category : #'as yet unclassified' }
Scenario >> allCompositeReferencesFor: variablePlusAttributes [

	|attributes compartment entities compResults|
	compartment := variablePlusAttributes first.	
	attributes := variablePlusAttributes allButFirst 
						collect: [ :attribute |  
							((concerns copy add: model; yourself) 
								select: [ :e | e attributes keys includes: (attribute)]) first attributes associationAt: attribute ].
	
	compResults := {{ self referencesFor: compartment } asOrderedCollection } asOrderedCollection.
	
	attributes do: [ :attribute | 
		|newCompResults|
		newCompResults := OrderedCollection new.
		compResults do: [ :resultList | 
			attribute value do: [ :value |
					newCompResults add: (resultList copy add: attribute key -> value; yourself).
			]
		].
		compResults := newCompResults.
	].
	
	
	^ compResults collect: [ :res | res asArray ]
	
]

{ #category : #'as yet unclassified' }
Scenario >> composition [ 

	^ composition
]

{ #category : #'as yet unclassified' }
Scenario >> doesNotUnderstand: aMessage [

	|variable value|

	"TODO: should also search in the concerns for setting comp/attri"
	
	variable := aMessage selector.
	variable := (variable asString trimRight: [: c | c =  $:]) asSymbol.
	value := aMessage arguments first.
 
	(model attributeValuesIncludes: variable)
		ifTrue: [ 
			explicitelySetCompartments add: variable.
			compartments at: variable put: value.
			model atCompartment: variable value: value. 
		] ifFalse: [  
		(model parameters keys includes: variable)
			ifTrue: [  
				parameters at: variable put: value.
				model atParameter: variable value: value. "can be array here treat differently"
			] ifFalse: [ 
					(aMessage selector asString includes: $_)
						ifTrue: [ self addCompositeAtrributeOrParameter: variable value: value ]
						ifFalse: [  
							KendrickDSLSyntaxError 
								signal: 'Undefined Variable Being Set: ' , variable asString
						] 
					]. 
		].
]

{ #category : #'as yet unclassified' }
Scenario >> entitiesFor: attr [ 

	"first list entities with attributes, second list entities with values"

	^ { 
	
		(attr collect: [:attribute | 
			((concerns copy add: model; yourself) 
				select: [ :e | 
					e attributes keys includes: attribute
	 			]
			)  ]) flatten.
			
		(attr collect: [:attribute | 
			((concerns copy add: model; yourself) 
				select: [ :e | 
					e attributes values first includes: attribute
	 			]
			) ]) flatten.	
			
	}	

]

{ #category : #'as yet unclassified' }
Scenario >> initialize [

	super initialize.
	concerns := OrderedCollection new. 
	compartments := Dictionary new. 
]

{ #category : #'as yet unclassified' }
Scenario >> on: aComposition [

	composition := Composition withId: aComposition.
	model := composition model.
	backEndEntity := model keModel.
	compartments := composition compartments.
	concerns := composition concerns.
]

{ #category : #'as yet unclassified' }
Scenario >> others: anInteger [

	model others: anInteger given: explicitelySetCompartments. "TODO: propagate to concerns as well"

	
]

{ #category : #'as yet unclassified' }
Scenario >> populationSize: aNumber [

	model population: aNumber
]

{ #category : #'as yet unclassified' }
Scenario >> referencesFor: anAttribute [

	|assoc|

	assoc := (model attributes 
		associations select: [ :as | as value includes: anAttribute ]) first.
	^ assoc key asSymbol -> anAttribute asSymbol 

	
]
