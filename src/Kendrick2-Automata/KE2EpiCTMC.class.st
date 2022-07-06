Class {
	#name : #KE2EpiCTMC,
	#superclass : #KE2StochastisProcess,
	#traits : 'KE2Process',
	#classTraits : 'KE2Process classTrait',
	#instVars : [
		'population'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #adding }
KE2EpiCTMC >> addParameter: aParameter [

	self addParameter: aParameter key value: aParameter value
]

{ #category : #adding }
KE2EpiCTMC >> addParameters: parametersCollection [
	parametersCollection
		do: [ :p | self addParameter: p ]
]

{ #category : #accessing }
KE2EpiCTMC >> atParameter: aSymbol [
	|p|
	p := (self parameters at: aSymbol ifAbsent: [ nil ]).
	p ifNotNil: [ ^ p value: self ].
	^ nil
]

{ #category : #accessing }
KE2EpiCTMC >> atParameter: aSymbol assignValue: value [
	self addParameter: aSymbol value: value
]

{ #category : #accessing }
KE2EpiCTMC >> atState: anObject [
	"Return cardinality of a state"

	| key c |
	anObject isDictionary
		ifTrue: [ key := anObject].
	anObject isArray
		ifTrue: [ key := Dictionary newFrom: anObject ].
	key
		at: #status
		ifPresent: [ (key at: #status) = #empty
				ifTrue: [ ^ self atParameter: #N ] ].
	c := self attributes keys reject: [ :a | key keys includes: a ].
	
	c isEmpty
		ifTrue: [ ^ self population sizeOfAState: key ]
		ifFalse: [ ^ (self atAttribute: c first)
				collect: [ :e | 
					| tmp |
					tmp := key copy.
					tmp at: c first put: e.
					self population sizeOfAState: tmp ] ]
]

{ #category : #accessing }
KE2EpiCTMC >> atState: keyInput put: number [


	| key |
	keyInput isDictionary | keyInput isSymbol ifTrue: [
		
		key := keyInput ].
	keyInput isArray ifTrue: [ key := Dictionary newFrom: keyInput ].
	 states at: key ifAbsent: [ 
		(self finestStateNames includes: key) ifFalse: [ 
			^ self error: 'No state names: ' , key asString ] ].
	 states at: key put: number
]

{ #category : #accessing }
KE2EpiCTMC >> atState: keyInput put: aNumber1 atOthersPut: aNumber2 [

	| key |
	key := Dictionary newFrom: keyInput.
	self finestStateNames do: [ :k | 
		k = key
			ifTrue: [ self atState: k put: aNumber1 ]
			ifFalse: [ self atState: k put: aNumber2 ] ]
]

{ #category : #accessing }
KE2EpiCTMC >> currentState [
	^ self parameters at: #currentState ifAbsent: [ nil ]
]

{ #category : #accessing }
KE2EpiCTMC >> currentState: aState [
	self parameters at: #currentState put: aState
]

{ #category : #'as yet unclassified' }
KE2EpiCTMC >> executeEventAtRateIndex: anInteger [

(self transitions at: anInteger ) executeOn: self times: 1.
^ states 
]

{ #category : #initialization }
KE2EpiCTMC >> initialize [

	super initialize.t := 0.
	self addParameter: #t value: [ :aModel | aModel t ].
	
	
	

]

{ #category : #accessing }
KE2EpiCTMC >> nextState [

	^ self parameters at: #nextState ifAbsent: [ nil ]
]

{ #category : #'as yet unclassified' }
KE2EpiCTMC >> nextState: aState [
	self parameters at: #nextState put: aState
]

{ #category : #accessing }
KE2EpiCTMC >> population [
	population ifNil: [ population := KE2Population new ].
	
]

{ #category : #accessing }
KE2EpiCTMC >> population: aPopulation [
	population := aPopulation
]

{ #category : #accessing }
KE2EpiCTMC >> rates [
	^ transitions
		collect: [ :tr | 
			| prob |
			(tr fromState at: #status) = #empty
				ifTrue: [ self currentState: tr toState ]
				ifFalse: [ self currentState: tr fromState ].
			self nextState: tr toState.
			prob := (tr rate value: self) abs.
			prob * (self atState: tr fromState)]
]
