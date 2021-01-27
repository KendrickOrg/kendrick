Class {
	#name : #Composition,
	#superclass : #KendrickComposite,
	#instVars : [
		'model',
		'concerns',
		'compartments'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #adding }
Composition >> addCompositeAtrributeOrParameter: variable value: value [

	|variablePlusAttributes|
	
	variablePlusAttributes := variable asString findTokens: '_'.
	"assume single attribute for the time being"
	
	(self model attributeValuesIncludes: variablePlusAttributes first asSymbol)
		ifTrue: [ self addCompositeAttribute: variablePlusAttributes value: value ] 
		ifFalse: [ (self model parameters keys includes: variablePlusAttributes first asSymbol)
			ifTrue: [ self addCompositeParameter: variablePlusAttributes value: value ] 
			ifFalse: [ KendrickDSLSyntaxError signal: 'Undefined Variable Being Set: ' , variable asString ] ]
	
]

{ #category : #'as yet unclassified' }
Composition >> addCompositeAttribute: variablePlusAttributes value: value [

	compartments at: variablePlusAttributes put: value.
	(self allCompositeReferencesFor: variablePlusAttributes)
		doWithIndex: [:ref :index|  
			(value anySatisfy: [ :item | item isCollection ])
				ifTrue: [ backEndEntity atCompartment: ref put: (value flatten at: index) ]
				ifFalse: [ backEndEntity atCompartment: ref put: (value at: index) ]		
		]
]

{ #category : #'as yet unclassified' }
Composition >> addCompositeParameter: variablePlusAttributes value: value [

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
Composition >> addCompositeParameterWithTwoAttributes: variablePlusAttributes value: value [

	| entityForSecond entityForThird |
	
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
Composition >> allCompositeReferencesFor: variablePlusAttributes [

	| attrKeys attrValues associations compartmentName|
	
	attrKeys := variablePlusAttributes select: [ :att| backEndEntity attributes keys includes: att ].
	attrValues := variablePlusAttributes reject: [ :att| backEndEntity attributes keys includes: att ].
	
	associations := attrKeys collect: [ :attKey| backEndEntity attributes associationAt: attKey ].	
	compartmentName := {(attrValues collect: [ :attValue | self referencesFor: attValue ])
								 asOrderedCollection} asOrderedCollection.
								
	associations do: [ :asso| 
		|tmp|
		tmp := OrderedCollection new.
		compartmentName do: [ :name| 
			asso value do: [ :v| tmp add: (name copy add: asso key -> v; yourself) ] ].
		compartmentName := tmp
		].
	
	^ compartmentName collect: [ :res | res asArray ]
	
]

{ #category : #'as yet unclassified' }
Composition >> compartments [

	^ compartments 

	
]

{ #category : #'as yet unclassified' }
Composition >> concern: aString [
	|concern|

	concern := KModel withId: aString.
	(concerns includes: concern) ifFalse: [  "no duplicates"
		concern extends do: [ :ext | 
			self concern: ext 
		]. "-- is this integrated in the backend ?" 
		concerns add: concern.
		self model integrate: concern.
	]
]

{ #category : #'as yet unclassified' }
Composition >> concerns [

	^ concerns 

	
]

{ #category : #'as yet unclassified' }
Composition >> doesNotUnderstand: aMessage [

	|variable value|

	"TODO: should also search in the concerns for setting comp/attri"
	
	variable := aMessage selector.
	variable := (variable asString trimRight: [: c | c =  $:]) asSymbol.
	value := aMessage arguments first.
	
	(self model attributeValuesIncludes: variable)
		ifTrue: [ 
			explicitelySetCompartments add: variable.
			compartments at: variable put: value.
			self model atCompartment: variable value: value. 
		] ifFalse: [  
		(self parameters keys includes: variable)
			ifTrue: [  
				parameters at: variable put: value.
				self model atParameter: variable value: value. "can be array here treat differently"
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
Composition >> entitiesFor: attr [ 

	"first list entities with attributes, second list entities with values"

	^ { 
	
		(attr collect: [:attribute | 
			((concerns copy add: self model; yourself) 
				select: [ :e | 
					e attributes keys includes: attribute
	 			]
			)  ]) flatten.
			
		(attr collect: [:attribute | 
			((concerns copy add: self model; yourself) 
				select: [ :e | 
					e attributes values first includes: attribute
	 			]
			) ]) flatten.	
			
	}	

]

{ #category : #'as yet unclassified' }
Composition >> gtInspectorKendrickGraphIn: composite [

	<gtInspectorPresentationOrder: -20>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	
	^ backEndEntity gtInspectorKendrickGraphIn: composite
]

{ #category : #accessing }
Composition >> id: aString [

	id := aString.
	model := ModelComponent new id: aString.
	backEndEntity := model keModel 
]

{ #category : #initialization }
Composition >> initialize [

	super initialize.
	concerns := OrderedCollection new. 
	compartments := Dictionary new. 
]

{ #category : #accessing }
Composition >> model [

	^ model 

	
]

{ #category : #accessing }
Composition >> model: aString [
	|concern|

	concern := KModel withId: aString.
	(concerns includes: concern) ifFalse: [  "no duplicates"
		concern extends do: [ :ext | 
			self concern: ext 
		]. "-- is this integrated in the backend ?" 
		concerns add: concern.
		self model integrate: concern.
	]
]

{ #category : #'as yet unclassified' }
Composition >> others: anInteger [

	self model others: anInteger given: explicitelySetCompartments. "TODO: propagate to concerns as well"

	
]

{ #category : #adding }
Composition >> parameters: aCollectionOfParameters [
	"Why do need to initialize parameters to zero ? they might be unitialized. By initializing parameter to zero, we are not able to distinguish an un-initialized parameter from a parameter set to zero."

	aCollectionOfParameters
		do: [ :p | 
			parameters at: p put: 0.
			self model parameters at: p put: 0 ]
]

{ #category : #'as yet unclassified' }
Composition >> populationSize: aNumber [

	self model population: aNumber
	
]

{ #category : #'as yet unclassified' }
Composition >> referencesFor: anAttribute [

	|assoc|

	assoc := (self model attributes 
		associations select: [ :as | as value includes: anAttribute ]) first.
	^ assoc key asSymbol -> anAttribute asSymbol 

	
]
