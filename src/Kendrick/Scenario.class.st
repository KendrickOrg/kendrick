Class {
	#name : #Scenario,
	#superclass : #KendrickModelingComponent,
	#instVars : [
		'model',
		'concerns',
		'compartments',
		'composition'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #adding }
Scenario >> addCompositeAtrributeOrParameter: variable value: value [

	|variablePlusAttributes|
	
	variablePlusAttributes := (variable asString findTokens: '_') collect: [:v| v asSymbol ].
	"assume single attribute for the time being"
	
	(model attributeValuesIncludes: variablePlusAttributes first)
		"if true, that's initialization of compartments"
		ifTrue: [ self addCompositeAttribute: variablePlusAttributes value: value ] 
		"if false, that's to assign value to parameter"
		ifFalse: [ 
			(model parameters keys includes: variablePlusAttributes first )
				ifTrue: [ self addCompositeParameter: variablePlusAttributes value: value ] 
				ifFalse: [ KendrickDSLSyntaxError signal: 'Undefined Variable Being Set: ' , variable asString ] ]
	
]

{ #category : #adding }
Scenario >> addCompositeAttribute: variablePlusAttributes value: value [

	"this function also should be generalized for the case having more than two attributes after the underscore"
	compartments at: variablePlusAttributes put: value.
	(self allCompositeReferencesFor: variablePlusAttributes)
		doWithIndex: [:ref :index|  
			(value anySatisfy: [ :item | item isCollection ])
				ifTrue: [ backEndEntity atCompartment: ref put: (value flatten at: index) ]
				ifFalse: [ backEndEntity atCompartment: ref put: (value at: index) ]		
		].
]

{ #category : #adding }
Scenario >> addCompositeParameter: variablePlusAttributes value: value [

	|parameterName attrKeys attrValues distinctAttrKeys twoDimAttrKeys secondOccInd| 
	
	"13/11/2019: maianh modified so that no implicit dimension is needed particularly for the 
	case of beta. For example: beta_regions: #(#(0.1 0.2) #(0.2 0.1))
	In this example, beta is two dimensional matrix but only one underscore syntax
	(in the left hand side) for _regions, the other dimension is implicitly defined for also regions.
	So it should be: beta_regions_regions: #(#(0.1 0.2) #(0.2 0.1)) and will be translated as: 
	beta_region1_region1 = 0.1, beta_region1_region2 = 0.2 etc.
	Other example: 
	beta_species_age: #(
		#(#(0.1 0.01) #(0.01 0.01))
		#(#(0.01 0.1) #(0.06 0.06))
		); 
	should be beta_species_age_age, the implicit dimension is of age.
	Supposing that after parameters, only attribute keys, no including attribute values after underscore
	For example: do not consider rho_species_S"
	
	"add this to parameters of Scenario for tracing first"
	parameters at: variablePlusAttributes put: value.
	"pick the name of the parameter, it should be the first element of the input list"
	parameterName := variablePlusAttributes first.
	"pick the list of all attribute keys in the input list"
	attrKeys := variablePlusAttributes select: [ :att| backEndEntity attributes keys includes: att ].
	"pick the list of all attribute values in the second list"
	attrValues := variablePlusAttributes reject: [ :att| backEndEntity attributes keys includes: att ].
	"pick all the distinct attribute keys "
	distinctAttrKeys := attrKeys asSet asOrderedCollection.
	"pick all the attribute keys which appear more than one time after underscore"
	twoDimAttrKeys := (attrKeys reject: [ :k| (attrKeys occurrencesOf: k) = 1 ]) asSet asOrderedCollection.
	secondOccInd := Dictionary newFrom: (twoDimAttrKeys collect: [:k| k->(attrKeys lastIndexOf: k)]).
	"translate from underscore syntax to back end"
	backEndEntity 
		addParameter: parameterName 
		value: 
		[ :aModel| |currentAttrValueIndex res isSecondDim|
			"find the correct index of attribute keys' current value"
			currentAttrValueIndex := Dictionary newFrom: (distinctAttrKeys collect: [:k| |ind|
				ind := (aModel attributes at: k) indexOf: (aModel currentCompartment at: k).
				(k->ind)]).
			res := value at: (currentAttrValueIndex at: (attrKeys first)).
			isSecondDim := false.
			attrKeys allButFirst doWithIndex: [ :v :ind| 
				(twoDimAttrKeys includes: v) 
					ifTrue: [ 
					((ind + 1) = (secondOccInd at: v)) 
						ifTrue: [ isSecondDim := true ] 
						ifFalse: [ isSecondDim := false. res := (res at: (currentAttrValueIndex at: v)) ] ]
					ifFalse: [  
						isSecondDim 
							ifTrue: [ res := (res collect: [ :e| e at: (currentAttrValueIndex at: v) ]) ]
							ifFalse: [ res := (res at: (currentAttrValueIndex at: v)) ]
					]
				].
			res ].


]

{ #category : #adding }
Scenario >> addCompositeParameterWithTwoAttributes: variablePlusAttributes value: value [

	| entityForSecond entityForThird |
	
	"should we remove entities because the model will be passed as argument of the block (aModel) has all
	necessary information?"
	entityForSecond := (self entitiesFor: {variablePlusAttributes second}) first first.
	entityForThird := (self entitiesFor: {variablePlusAttributes third}) first first. 

	backEndEntity 
        addParameter: variablePlusAttributes first asSymbol
        value: [ :aModel| |c1 c2 index1 index2| 
			c1 := aModel currentCompartment at: variablePlusAttributes second.
			variablePlusAttributes last asSymbol = 'next' 
				ifFalse: [c2 := aModel currentCompartment at: variablePlusAttributes third]
				ifTrue: [c2 := aModel nextCompartment at: variablePlusAttributes third].
			index1 := (aModel attributes at: variablePlusAttributes second) indexOf: c1.
			index2 := (aModel attributes at: variablePlusAttributes third) indexOf: c2.
			(value at: index1) at: index2.
	 ].


]

{ #category : #'as yet unclassified' }
Scenario >> allCompositeReferencesFor: variablePlusAttributes [

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

	"return two lists: first list entities with attributes, second list entities with values
	for example, entitiesFor: {species age} will return "
	

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

{ #category : #accessing }
Scenario >> parameters: anArray [
	anArray do: [ :p| 
		parameters at: p put: 0.
		model parameters at: p put: 0 ]
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
