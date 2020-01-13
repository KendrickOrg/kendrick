"
Abstract class of KEConcern and KEModel
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
	self attributes at: aSymbol put: aDomain
]

{ #category : #adding }
KEComponent >> addEquation: aString [
	equations addLast: aString parseAsAnEquation 
]

{ #category : #adding }
KEComponent >> addEquations: aCollectionOfEquations [
	aCollectionOfEquations do: [ :eachString | self addEquation: eachString ]
]

{ #category : #'as yet unclassified' }
KEComponent >> addParameter: aSymbol [
	self addParameter: aSymbol value: nil
]

{ #category : #'as yet unclassified' }
KEComponent >> addParameter: aSymbol value: aNumericalOrAnExpressionOrABlock [
	|expression|
	aNumericalOrAnExpressionOrABlock isNumber 
	ifTrue: [ expression := (KENumerical new number: aNumericalOrAnExpressionOrABlock) ]
	ifFalse: [ 
		aNumericalOrAnExpressionOrABlock isString 
		ifTrue: [ expression := (aNumericalOrAnExpressionOrABlock parseAsAnExpression) ]
		ifFalse: [ expression := aNumericalOrAnExpressionOrABlock ]
	].
	parameters at: aSymbol put: (KEParameter new symbol: aSymbol; expression: expression)
]

{ #category : #'as yet unclassified' }
KEComponent >> addParameters: input [
	input do: [ :e| self addParameter: e ]
	
	
]

{ #category : #'as yet unclassified' }
KEComponent >> addTransition: aTransition [
	transitions add: aTransition
]

{ #category : #'as yet unclassified' }
KEComponent >> addTransitionFrom: aCompartment to: anotherCompartment probability: aBlock [
	self addTransition: (KETransition from: aCompartment to: anotherCompartment probability: aBlock)
]

{ #category : #'as yet unclassified' }
KEComponent >> atAttribute: aSymbol [
	^ attributes at: aSymbol ifAbsent: [ nil ]
]

{ #category : #'as yet unclassified' }
KEComponent >> atAttribute: aSymbol add: aValue [
	|newDomain|
	attributes at: aSymbol ifAbsent: [ ^ self error: 'Cannot find attribute ', aSymbol asString ].
	newDomain := OrderedCollection new.
	newDomain addAll: (attributes at: aSymbol).
	newDomain add: aValue.
	attributes at: aSymbol put: newDomain
]

{ #category : #accessing }
KEComponent >> attributes [
	^ attributes
]

{ #category : #'as yet unclassified' }
KEComponent >> attributes: inputArray [
	"input must be an array of associations: {#status->#(#S #I #R). #age->#(#child #adult)}..."
	attributes := Dictionary newFrom: inputArray
]

{ #category : #'as yet unclassified' }
KEComponent >> buildEquations [
	"Return the suitable array for KESimulatorDeterministic in order to solve the equations."
	"This method should be merge with equations method in the same class: issue #40"

	| eq |
	eq := Dictionary new.
	self compartmentNames do: [ :k| eq at: k put: OrderedCollection new ].
	self transitions do: [ :tr|
		(tr from at: #status) = #empty ifTrue:
			[ (eq at: tr to) add: (Array with: tr with: 1) ].
		(tr to at: #status) = #empty ifTrue:
			[ (eq at: tr from) add: (Array with: tr with: -1) ].
		(((tr from at: #status) ~= #empty) and: [ (tr to at: #status) ~= #empty ]) ifTrue:[ 
			(eq at: tr from) add: (Array with: tr with: -1).
			(eq at: tr to) add: (Array with: tr with: 1) ]
		 ].
	^eq
]

{ #category : #'as yet unclassified' }
KEComponent >> compartmentNames [
	|names expand keys|
	names := OrderedCollection new.
	self attributes keys do: [ :e| 
		names add: ((self atAttribute: e) collect: [ :v| (e->v) ])
	].
	expand := [ :prefix :list| 
		list isEmpty
		ifTrue: [ Array with: prefix ]
		ifFalse: [ |tail|
			tail := list allButFirst: 1.
			list first inject: #() into: [ :all :each|
				all, (expand value: (prefix copyWith: each) value: tail) ] ] ].
	keys := expand value: #() value: names.
	keys = #(#()) ifTrue: [ keys := #() ].
	^ (keys collect: [ :e| Dictionary newFrom: e ])
]

{ #category : #'as yet unclassified' }
KEComponent >> equations [
	^ equations
]

{ #category : #accessing }
KEComponent >> equationsToTransitions [
	|  events |
	events := self generateEvents.
	events
		do: [ :e | 
			e fromStatus = #empty
				ifTrue: [ "|symbol|
			symbol := parameters keyAtValue: #sizeOfPopulation ifAbsent: [#N]." e rate: (e rate remove: (KEVariable new symbol: #N)) ] ].
	events
		do: [ :each | 
			| from to |
			from := each fromStatus = #empty
				ifTrue: [ #empty ]
				ifFalse: [ Dictionary newFrom: {(#status -> each fromStatus)} ].
			to := each toStatus = #empty
				ifTrue: [ #empty ]
				ifFalse: [ Dictionary newFrom: {(#status -> each toStatus)} ].
			self addTransitionFrom: from to: to probability: each rate ].
	equations := OrderedCollection new
]

{ #category : #'as yet unclassified' }
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
							e actions addAll: anEvent actions.
							e mapStatusWith: anEvent ]
						ifFalse: [ events add: anEvent ] ] ].
	events := self mergeEventsWithSameActionsIn: events.
	^ events
]

{ #category : #'as yet unclassified' }
KEComponent >> imports: aMatrix [
"constructing transitions using an adjacency matrix"
|att dom|
att := self attributes associations first key.
dom := self attributes associations first value.
dom size ~= aMatrix size ifTrue: [ ^ self error: 'Size of input is not compatible' ].
1 to: aMatrix size do: [ :row| 
	1 to: (aMatrix at: row) size do: [ :col|
		(((aMatrix at: row) at: col) ~= 0) ifTrue: [ 
			self addTransitionFrom: { att->(dom at: row) } to: { att->(dom at: col) } probability: ((aMatrix at: row) at: col) asString]
	]
]
	
]

{ #category : #initialization }
KEComponent >> initialize [
	super initialize.
	attributes := Dictionary new.
	equations := OrderedCollection new.
	transitions := OrderedCollection new.
	parameters := Dictionary new
]

{ #category : #'as yet unclassified' }
KEComponent >> mergeEventsWithSameActionsIn: eventList [
	"This function will find all events with same actions and merge their rate in one event"
	|newList|
	newList := OrderedCollection new.
	eventList do: [ :event|
		(event hasAnEventWithSameActionsIn: newList)
		ifTrue: [ |e|
			e := event findEventWithSameActionsIn: newList.
			e rate: ((KEBinaryExpression new) op: #+; leftHandSide: (e rate); rightHandSide: (event rate))
			 ]
		ifFalse: [ newList add: event ].
		 ].
	newList do: [ :each|
		(each fromStatus = #empty) 
		"ifTrue: [
			each rate: (each rate remove: (KEVariable new symbol: #N)) ]"
		ifFalse: [ each rate: (each rate remove: (KEVariable new symbol: each fromStatus)) ]
		 ].
	^ newList

]

{ #category : #'as yet unclassified' }
KEComponent >> parameters [
	^ parameters
]

{ #category : #'as yet unclassified' }
KEComponent >> transitionRates: anExpressionOrBlock [
	"setting same rate for all transitions"
	self transitions do: [ :tr| 
		tr probability: anExpressionOrBlock	
	]
]

{ #category : #accessing }
KEComponent >> transitions [
	equations isNotEmpty
		ifTrue: [ self equationsToTransitions ].

	"generate a transition rate matrix of 0"
		transitions isEmpty
		ifTrue: [ self compartmentNames
				do: [ :e | 
					transitions
						addAll: (self compartmentNames collect: [ :f | KETransition from: e to: f probability: 0 ]) ] ].

	^ transitions
]

{ #category : #'as yet unclassified' }
KEComponent >> transitions: aTransitionList [
	transitions := aTransitionList 
]
