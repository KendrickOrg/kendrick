Class {
	#name : #KendrickModelingComponent,
	#superclass : #KendrickInternalDSLEntities,
	#instVars : [
		'attributes',
		'parameters',
		'equations',
		'transitions',
		'explicitelySetCompartments',
		'otherCompartmentValue',
		'emptyRate',
		'backEndEntity'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'public-api' }
KendrickModelingComponent >> allLiteralTransitionRefsForAttribute: attribute [
	
	^ [(attributes at: attribute) collect: [:comp |  attribute  -> comp ]] on: KeyNotFound do: [ self literalTransitionRefFor: attribute ]
]

{ #category : #'public-api' }
KendrickModelingComponent >> allTransitionRefsForAttribute: attribute [
	(attributes keys includes: attribute)
		ifTrue: [ 
			^ (attributes at: attribute) collect: [:comp | '{#' , attribute asString , ': #' , comp , '}'] 		].
	^ {(self transitionRefFor: attribute)} asOrderedCollection
	
]

{ #category : #'public-api' }
KendrickModelingComponent >> allTransitionsFor: aFromToList [

		|from to probability|

		from := aFromToList first.
		probability := aFromToList second.
		to := aFromToList last.
		({ from . to } includes: #Empty) ifTrue: [ emptyRate := probability ].
		(self isAttribute: from)
			ifTrue: [ 
				(self allTransitionRefsForAttribute: from) do: [:fromRef |  
					backEndEntity
   						addTransitionFrom: fromRef
   						to: (self transitionRefFor: to)
   						probability: [ :m | m atParameter: probability ].			
				]
			]
			ifFalse: [ "to = all"
				(self isAttribute: to)
					ifTrue: [  
						(self allTransitionRefsForAttribute: from) do: [:toRef |  
							backEndEntity
   								addTransitionFrom: (self transitionRefFor: from)
   								to: toRef
   								probability: [ :m | m atParameter: probability ].			
						]
					] ifFalse: [ "no attributes"  
						backEndEntity
   								addTransitionFrom: (self transitionRefFor: from)
   								to: (self transitionRefFor: to)
   								probability: [ :m | m atParameter: probability ].
					]		
			 ] 
			
	
]

{ #category : #accessing }
KendrickModelingComponent >> atAttribute: aSymbol [
	^ attributes at: aSymbol
]

{ #category : #'public-api' }
KendrickModelingComponent >> attribute: anArray [
	|attVals|
	
	attVals := (anArray allButFirst select: [:var | var ~= #->]).
	(attVals includes: #':') 
		ifTrue: [ attVals := ((attVals first) to: (attVals last)) ].
	
	attVals := (attVals collect: [ :var | var asString asSymbol]) asOrderedCollection.
	
	attributes 
		at: anArray first 
		put: attVals.

	backEndEntity 
		addAttribute: anArray first 
		value: attVals asArray. 
	
]

{ #category : #protected }
KendrickModelingComponent >> attributeValuesIncludes: variable [

	^ (attributes values select: [ :values | values includes: variable ]) isEmpty not
]

{ #category : #protected }
KendrickModelingComponent >> attributes [

	^ attributes
]

{ #category : #'public-api' }
KendrickModelingComponent >> backEndModel [

^backEndEntity 
]

{ #category : #'public-api' }
KendrickModelingComponent >> equations: anArrayOfSymExpressions [

	equations :=
		KendrickEquations new with: anArrayOfSymExpressions.
	backEndEntity addEquations: equations convertToCompatibleBackendRepresentation.
	
]

{ #category : #'public-api' }
KendrickModelingComponent >> imports: aMatrix using: transition [

|att dom|
att := self attributes associations first key.
dom := self attributes associations first value.
dom size ~= aMatrix size ifTrue: [ ^ self error: 'Size of input is not compatible' ].
1 to: aMatrix size do: [ :row| 
	1 to: (aMatrix at: row) size do: [ :col|
		(((aMatrix at: row) at: col) ~= 0) ifTrue: [ 
			|probability|
			
			probability :=
				((aMatrix at: row) at: col) = 0 
					ifFalse: [ probability := transition asString ]
					ifTrue: [ 0 asString ].
			
			backEndEntity 
				addTransitionFrom: { att->(dom at: row) } to: { att->(dom at: col) } 
				probability:  probability asString].
	]
]
	
	
]

{ #category : #'public-api' }
KendrickModelingComponent >> initialize [
	super initialize.
	attributes := Dictionary new.
	parameters := Dictionary new.
	explicitelySetCompartments := OrderedCollection new.
		
]

{ #category : #protected }
KendrickModelingComponent >> isAttribute: attribute [
	
	^ (attributes keys includes: attribute) 
]

{ #category : #protected }
KendrickModelingComponent >> literalTransitionRefFor: aCompartment [

"Returns the name of the compartment"

	| assoc |
	aCompartment = 'Empty' ifTrue: [ ^ #empty ].
	assoc := (attributes associations select: [ :pair | 
		          pair value includes: aCompartment ]) first.
	^ { (assoc key -> aCompartment) }
]

{ #category : #'public-api' }
KendrickModelingComponent >> others: anInteger [

	otherCompartmentValue := anInteger.
		
]

{ #category : #protected }
KendrickModelingComponent >> parameters [

	^ parameters 
]

{ #category : #'public-api' }
KendrickModelingComponent >> parameters: anArray [

	anArray do: [ :var | parameters at: var put: 0 ]
]

{ #category : #protected }
KendrickModelingComponent >> transitionRefFor: aCompartment [
	
	|assoc|
	aCompartment = 'Empty'
		ifTrue: [ ^ #empty ].
	assoc := (attributes associations select: [ :pair | pair value includes: aCompartment ]) first.
	^ '{#' , assoc key asString , ': #' , aCompartment , '}'.
]

{ #category : #'public-api' }
KendrickModelingComponent >> transitions [

	^ transitions 
		ifNotNil: [ transitions convertToCompatibleBackendRepresentation]
		ifNil: [ 
			transitions := 
				backEndEntity transitions
					collect: [ :t | (t from associations first value -> nil -> t to associations first value) ] 
		]
		
]

{ #category : #'public-api' }
KendrickModelingComponent >> transitions: aSymExpression [
	transitions :=
		KendrickTransitions new with: aSymExpression.
	transitions convertToCompatibleBackendRepresentation do: [:assoc |
		|from to probability|
		from := assoc key key asString asSymbol.
		probability := assoc key value.
		to := assoc value asString asSymbol.
		self allTransitionsFor: { from . probability . to } ].
		
]
