"
Abstract class of KEConcern and KEModel

- parameters: Collection <KEParameter>
- attributes: Dictionary of attribute (attribute name -> possible values)

"
Class {
	#name : #KEComponent,
	#superclass : #KEEntity,
	#instVars : [
		'attributes',
		'parameters',
		'equations',
		'transitions'
	],
	#category : #'Kendrick-Core'
}

{ #category : #adding }
KEComponent >> addAttribute: aSymbol value: aDomain [

"A domain is an array of symbols like #(#S #I #R)"
	attributes at: aSymbol put: aDomain
]

{ #category : #adding }
KEComponent >> addEquation: aString [
	equations addLast: aString parseAsAnEquation 
]

{ #category : #adding }
KEComponent >> addEquations: aCollectionOfEquations [
	aCollectionOfEquations do: [ :eachString | self addEquation: eachString ]
]

{ #category : #parameters }
KEComponent >> addParameter: aSymbol value: aNumericalOrAnExpressionOrABlock [
	| expression |
	aNumericalOrAnExpressionOrABlock isNumber
		ifTrue: [ expression := KENumerical new
				number: aNumericalOrAnExpressionOrABlock ]
		ifFalse: [ aNumericalOrAnExpressionOrABlock isString
				ifTrue:
					[ expression := aNumericalOrAnExpressionOrABlock parseAsAnExpression ]
				ifFalse: [ expression := aNumericalOrAnExpressionOrABlock ] ].
	parameters
		at: aSymbol
		put:
			(KEParameter new
				symbol: aSymbol;
				expression: expression)
]

{ #category : #'as yet unclassified' }
KEComponent >> addTransition: aTransition [
	transitions add: aTransition
]

{ #category : #'as yet unclassified' }
KEComponent >> addTransitionFrom: aCompartment to: anotherCompartment probability: aBlock [

	self addTransition: (KETransition
			 from: aCompartment
			 to: anotherCompartment
			 probability: aBlock)
]

{ #category : #accessing }
KEComponent >> atAttribute: aSymbol [
	^ attributes at: aSymbol
]

{ #category : #adding }
KEComponent >> atAttribute: aSymbol add: aValue [

"Add a new value to an existing attribute"
	| newDomain |
	attributes
		at: aSymbol
		ifAbsent: [ ^ self error: 'Cannot find attribute ' , aSymbol asString ].
	newDomain := OrderedCollection new.
	newDomain addAll: (attributes at: aSymbol).
	newDomain add: aValue.
	attributes at: aSymbol put: newDomain
]

{ #category : #accessing }
KEComponent >> attributes [
"Return attributes as a Dictionary"
	^ attributes
]

{ #category : #modifying }
KEComponent >> attributes: inputArray [
	"Input array is an array of associations like {#status->#(#S #I #R). #age->#(#child #adult)}
	Should be deprecated because we should be able to add only one attributes. Multiple attributes are set when we sum multiple concerns."

	attributes := Dictionary newFrom: inputArray
]

{ #category : #parameters }
KEComponent >> changeParameter: aSymbol value: aNumericalOrAnExpressionOrABlock [
	
	| expression |
 	aSymbol ifNotEmpty: [  
	aNumericalOrAnExpressionOrABlock isNumber 
	ifTrue: [ expression := (KENumerical new number: aNumericalOrAnExpressionOrABlock) ]
	ifFalse: [ 
		aNumericalOrAnExpressionOrABlock isString 
		ifTrue: [ expression := (aNumericalOrAnExpressionOrABlock parseAsAnExpression) ]
		ifFalse: [ expression := aNumericalOrAnExpressionOrABlock ]
	].
].
	parameters at: aSymbol put: (KEParameter new symbol: aSymbol; expression: expression)
]

{ #category : #accessing }
KEComponent >> compartmentNames [
	"Return an Array containing Dictionaries ...
	What a mess !!!
	The array is built only by doing a cross-product of attributes.
	We should do that built using the compartments of the model instead.
	"

	| names expand keys |
	names := OrderedCollection new.
	self attributes
		keysDo: [ :e | names add: ((self atAttribute: e) collect: [ :v | e -> v ]) ].
	expand := [ :prefix :list | 
	list isEmpty
		ifTrue: [ Array with: prefix ]
		ifFalse: [ | tail |
			tail := list allButFirst: 1.
			list first
				inject: #()
				into:
					[ :all :each | all , (expand value: (prefix copyWith: each) value: tail) ] ] ].
	keys := expand value: #() value: names.
	keys = #(#())
		ifTrue: [ keys := #() ].
	^ keys collect: [ :e | Dictionary newFrom: e ]
]

{ #category : #accessing }
KEComponent >> equations [

"	equations ifEmpty: [ self transitionsToEquations ]."
	^ equations
]

{ #category : #accessing }
KEComponent >> equationsToTransitions [
	"This is only working for status ODE equations, not general ODE equations"

	| events |
	events := self generateEvents.

	"Remove N variable in events rate. Why?"
	events do: [ :e | 
		e fromStatus = #empty ifTrue: [ 
			e rate: (e rate removeVariable: (KEVariable new symbol: #N)) ] ].

	events do: [ :each | 
		self
			addTransitionFrom: { (#status -> each fromStatus) }
			to: { (#status -> each toStatus) }
			probability: each rate ].

	"Why initializing equations at the end?"
	equations := OrderedCollection new
]

{ #category : #'generating events' }
KEComponent >> generateEvents [
	| events |
	events := OrderedCollection new.
	self equations
		do: [ :eq | 
			| eventList |
			eventList := eq generateEvents.
			eventList
				do: [ :anEvent | 
					(anEvent hasAnEventWithOppositeRateIn: events)
						ifTrue: [ | e |
							e := anEvent findEventWithOppositeRateIn: events.
							"e fromStatus: anEvent fromStatus.
							e toStatus: anEvent toStatus."
							"e actions addAll: anEvent actions."
							e mapStatusWith: anEvent ]
						ifFalse: [ events add: anEvent ] ] ].
	^ self mergeEventsWithSameActionsIn: events
]

{ #category : #initialization }
KEComponent >> initialize [
	super initialize.
	attributes := Dictionary new.
	equations := OrderedCollection new.
	transitions := OrderedCollection new.
	parameters := Dictionary new
]

{ #category : #initialization }
KEComponent >> initializeTransitionsWithZeroRate [

		self compartmentNames
				do: [ :e | 
					transitions
						addAll: (self compartmentNames collect: [ :f | KETransition from: e to: f probability: 0 ]) ]
]

{ #category : #'generating events' }
KEComponent >> mergeEventsWithSameActionsIn: eventList [
	"This function will find all events with same actions and merge their rate in one event"

	| newList |
	newList := OrderedCollection new.
	eventList
		do: [ :event | 
			(event hasAnEventWithSameActionsIn: newList)
				ifTrue: [ | e |
					e := event findEventWithSameActionsIn: newList.
					e
						rate:
							(KEBinaryExpression new
								op: #+;
								leftHandSide: e rate;
								rightHandSide: event rate) ]
				ifFalse: [ newList add: event ] ].
	newList
		do: [ :each | 
			each fromStatus = #empty
				ifFalse: [ each
						rate: (each rate removeVariable: (KEVariable new symbol: each fromStatus)) ]
			"ifTrue: [
			each rate: (each rate remove: (KEVariable new symbol: #N)) ]" ].
	^ newList
]

{ #category : #parameters }
KEComponent >> parameters [
"Return collection of KEParameters"
	^ parameters
]

{ #category : #accessing }
KEComponent >> transitions [

	equations isNotEmpty ifTrue: [ self equationsToTransitions ].
	
	"This is a bit strange, a model without transitions or equations ... 
	This should not be a correctly initialized model"
	transitions isEmpty ifTrue: [ self initializeTransitionsWithZeroRate ].
	^ transitions
]

{ #category : #'as yet unclassified' }
KEComponent >> transitions: aTransitionList [
	transitions := aTransitionList 
]

{ #category : #'as yet unclassified' }
KEComponent >> transitionsToEquations [

	"Return the suitable Dictionary for KESimulatorDeterministic in order to solve the equations.
	This method should be merged with equations method in the same class: issue #40
	Seems to return a Dictionary with keys are dictionary and values are orderedCollection ..."

	| eq |
	eq := Dictionary new.
	
	"Initialized for each compartment, an empty equation"
	self compartmentNames do: [ :k | eq at: k put: OrderedCollection new ].
	
	self transitions do: [ :tr | 
		((tr from at: #status) ~= #empty and: [ 
			 (tr to at: #status) ~= #empty ]) ifTrue: [ 
			(eq at: tr from) add: (Array with: tr with: -1).
			(eq at: tr to) add: (Array with: tr with: 1) ] ].
	equations := eq
]
