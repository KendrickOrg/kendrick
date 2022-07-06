"
A stochastic class process
"
Class {
	#name : #KE2StochastisProcess,
	#superclass : #Object,
	#instVars : [
		'attributes',
		'parameters',
		'transitions',
		'states'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #adding }
KE2StochastisProcess >> addAttribute: aSymbol value: aDomain [

"A domain is an array of symbols like #(#S #I #R)"
	attributes at: aSymbol put: aDomain
]

{ #category : #adding }
KE2StochastisProcess >> addParameter: aSymbol value: aNumericalOrAnExpressionOrABlock [
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

{ #category : #adding }
KE2StochastisProcess >> addTransition: aTransition [
	transitions add: aTransition
]

{ #category : #adding }
KE2StochastisProcess >> addTransitionFromState: aState toState: anotherState rate: aBlock [

	self addTransition: (KE2EpiCTMCTransition 
			 fromState: aState
			 toState: anotherState
			 rate: aBlock)
]

{ #category : #accessing }
KE2StochastisProcess >> atAttribute: aSymbol [
	^ attributes at: aSymbol
]

{ #category : #accessing }
KE2StochastisProcess >> atAttribute: aSymbol add: aValue [

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
KE2StochastisProcess >> attributes [

	^ attributes
]

{ #category : #accessing }
KE2StochastisProcess >> attributes: attributesArray [

	(self duplicateValues: attributesArray)
		ifTrue: [ self error: 'Attributes are duplicated.' ]
		ifFalse: [ attributes := Dictionary newFrom: attributesArray ]
]

{ #category : #modifying }
KE2StochastisProcess >> duplicateValues: anArrayOfAssociations [

	| values |
	values := (anArrayOfAssociations collect:
		          [ :each | each value ]) flatten.
	^ (values asSet size) ~~ (values size)
]

{ #category : #'as yet unclassified' }
KE2StochastisProcess >> executeEventAtRateIndex: anInteger [

	^self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
KE2StochastisProcess >> finestStateNames [ 

	| names expand keys |
	names := OrderedCollection new.
	self attributes keysDo: [ :e | 
		names add: ((self atAttribute: e) collect: [ :v | e -> v ]) ].
	expand := [ :prefix :list | 
	          list isEmpty
		          ifTrue: [ Array with: prefix ]
		          ifFalse: [ 
			          | tail |
			          tail := list allButFirst: 1.
			          list first inject: #(  ) into: [ :all :each | 
				          all
				          , (expand value: (prefix copyWith: each) value: tail) ] ] ].
	keys := expand value: #(  ) value: names.
	keys = #( #(  ) ) ifTrue: [ keys := #(  ) ].
	^ keys collect: [ :e | Dictionary newFrom: e ]
]

{ #category : #accessing }
KE2StochastisProcess >> parameters [

	^ parameters
]

{ #category : #accessing }
KE2StochastisProcess >> rates [
	^self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
KE2StochastisProcess >> sizeOfAState:  aStateName [
	^ self states at: aStateName ifAbsent: [ ^ self error: 'No state name: ', aStateName asString ]
]

{ #category : #accessing }
KE2StochastisProcess >> states [
	^states
]

{ #category : #accessing }
KE2StochastisProcess >> states: aDictionary [

	self states ifNil: [ states := Dictionary new ]. 

	aDictionary keysAndValuesDo: [ :k :v | states at: k put: v ]
]

{ #category : #accessing }
KE2StochastisProcess >> transitions [

	"transitions isEmpty ifTrue: [ self initializeTransitionsWithZeroRate ]."
	^ transitions
]

{ #category : #accessing }
KE2StochastisProcess >> transitions: aTransitionList [
	transitions := aTransitionList 
]
