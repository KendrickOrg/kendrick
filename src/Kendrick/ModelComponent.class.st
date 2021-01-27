Class {
	#name : #ModelComponent,
	#superclass : #KendrickModelingComponent,
	#instVars : [
		'population'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #protected }
ModelComponent >> addParameter: variable value: value [

	"value is an expression expressed as a string"
	value isString 
		ifTrue: [ backEndEntity atParameter: variable assignValue: value parseAsAnExpression ]
		ifFalse: [ 
			value isNumber 
				ifTrue: [backEndEntity addParameter: variable value: value]
				ifFalse: [ "array" 
					backEndEntity 
						addParameter: variable 
						value: (self covertSymbolicExpressionToBlock: value).
				]
			]

	
]

{ #category : #protected }
ModelComponent >> allTransitionRefsForAttributeWith: aCompartment [
	
	|assoc|

	aCompartment asString translateToLowercase = 'empty'
		ifTrue: [ ^ { #empty } ].
	
	assoc := (attributes associations select: [ :pair | pair value includes: aCompartment ]).
	^ assoc value collect: [:comp | '{#' , assoc key asString , ': #' , comp , '}']
]

{ #category : #protected }
ModelComponent >> atCompartment: variable value: value [

	|assoc|

	assoc := (attributes associations select: [ :as | as value includes: variable ]) first.
	backEndEntity atCompartment: {assoc key -> variable} put: value
	
]

{ #category : #protected }
ModelComponent >> atParameter: variable value: value [

	"value is an expression expressed as a string"
	value isString 
		ifTrue: [ backEndEntity atParameter: variable assignValue: value parseAsAnExpression ]
		ifFalse: [ 
			value isNumber 
				ifTrue: [backEndEntity addParameter: variable value: value]
				ifFalse: [ "array" 
					backEndEntity 
						addParameter: variable 
						value: (self covertSymbolicExpressionToBlock: value).
				]
			]

	
]

{ #category : #protected }
ModelComponent >> attributeKeyValueFrom: attributeKeyOrValue [
	| attributeValue as |
	"if an attribute key, return the corresponding association with attribute value taken from current compartment"
	(attributes keys includes: attributeKeyOrValue)
		ifTrue: [ attributeValue := backEndEntity currentCompartment at: attributeKeyOrValue.
			^ {(attributeKeyOrValue -> attributeValue)} ].
	"if an attribute value, return the corresponding association"
	as := attributes associations
		select: [ :arg2 | arg2 value includes: attributeKeyOrValue ].
	^ {(as first key -> attributeKeyOrValue)}
]

{ #category : #protected }
ModelComponent >> attributeOrParameter: aName [

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
										|comp|
										comp := OrderedCollection new.
										tokens do: [ :att| comp addAll: (self attributeKeyValueFrom: att) ].
										backEndEntity atCompartment: comp asArray
									] ifTrue: [  
										backEndEntity sizeOfPopulation: (tokens collect: [:t | (backEndEntity currentCompartment at: t)]) asArray.
									]
							]
							ifFalse: [backEndEntity sizeOfPopulation: (Array with: (backEndEntity currentCompartment at: aName asSymbol))] 
				] "assume attribute name"
				ifFalse: [
								backEndEntity atCompartment: { assoc first key -> aName }
				]
		]
	
]

{ #category : #protected }
ModelComponent >> covertSymbolicExpressionToBlock: anArray [
	| body |
	body := (anArray collect: [ :token | self tokenAsString: token ])
		inject: ''
		into: [ :expr :token | 
			(#(sum sqrt size) includes: token)
				ifFalse: [ expr , ' ' , token ]
				ifTrue: [ '(' , expr , ')' , token ] ].
	"the argument is superficial here since it is captured (backward compatibility)"
	^ OpalCompiler new
		source: '[:aModel |' , body , ']';
		context: thisContext sender;
		receiver: thisContext sender receiver;
		requestor: nil;
		failBlock: [ ^ nil ];
		logged: false;
		evaluate
]

{ #category : #'public-api' }
ModelComponent >> doesNotUnderstand: aMessage [

	|variable value|
	
	variable := aMessage selector.
	variable := (variable asString trimRight: [: c | c =  $:]) asSymbol.
	value := aMessage arguments first.
 
	(self attributeValuesIncludes: variable)
		ifTrue: [ 
			explicitelySetCompartments add: variable.
			self atCompartment: variable value: value. 
		] ifFalse: [  
		(self parameters keys includes: variable)
			ifTrue: [  
				parameters at: variable put: value.
				self addParameter: variable value: value. "can be array here treat differently"
			] ifFalse: [ 
					KendrickDSLSyntaxError 
								signal: 'Undefined Variable Being Set: ' , variable asString ]. 
		].
	
	
]

{ #category : #protected }
ModelComponent >> initialize [

	super initialize.
	backEndEntity := KEModel new.
	parameters at: #N put: nil. "seems to be a default one"
]

{ #category : #protected }
ModelComponent >> integrate: concern [.

	backEndEntity integrate: concern keConcern.
	parameters addAll: concern parameters.
	concern parameters keysAndValuesDo: [ :key :value | self addParameter: key value: value ].
	attributes addAll: concern attributes. "init compartments from concerns not possible just add"
	

]

{ #category : #protected }
ModelComponent >> keModel [

	^ backEndEntity
]

{ #category : #'public-api' }
ModelComponent >> others: anInteger [

	otherCompartmentValue := anInteger.

	backEndEntity attributes
		associationsDo: [ :assoc | 
			assoc value do: [:var |
				(explicitelySetCompartments includes: var)
					ifFalse: [ self atCompartment: var value: anInteger ]
			] 
		]
]

{ #category : #'public-api' }
ModelComponent >> others: anInteger given: explicitelySetCompInOtherEntity [

	explicitelySetCompartments addAll: explicitelySetCompInOtherEntity.
	self others: anInteger
]

{ #category : #'public-api' }
ModelComponent >> population: anInteger [

	population := anInteger.
	backEndEntity population: (KEPopulation size: anInteger).
]

{ #category : #protected }
ModelComponent >> tokenAsString: token [

 token isArray ifTrue: [ 
		^ (token 
			inject: '( ' 
			into: [:subTotal :t | subTotal , ' ' ,  (self tokenAsString: t) ]) , ')'
	].

 ^ (#(- + * / , sum sqrt) includes: token)
				ifTrue: [ token asString ]
				ifFalse: [ 
						 '(self attributeOrParameter: ' ,  '#' , token asString , ')' 
				]			
]
