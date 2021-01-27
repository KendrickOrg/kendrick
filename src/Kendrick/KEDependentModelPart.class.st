"
A dependent concern is a concern that depends on another one.

Is this class, really useful ? This class is used in only method: KModelPart>>dependOn:
"
Class {
	#name : #KEDependentModelPart,
	#superclass : #KEModelPart,
	#category : #'Kendrick-Core'
}

{ #category : #operators }
KEDependentModelPart >> addStatus: anArrayOfSymbol [
	anArrayOfSymbol do: [ :aSymbol| self atAttribute: #status add: aSymbol ]
	
]

{ #category : #'as yet unclassified' }
KEDependentModelPart >> generateSum: aTransitionList [
	|result|
	result := OrderedCollection new.
	aTransitionList  do: [ :e| 
		|tmp|
		tmp := self transitions select: [ :tr| (tr from = e from) & (tr to = e to) ].
		tmp isEmpty 
		ifTrue: [ result add: e ]
	].
	result addAll: (self transitions select: [ :tr| tr probability ~= 0 ]).
	^ result
	
	
]

{ #category : #'as yet unclassified' }
KEDependentModelPart >> generateTensorSum: aTransitionList [
	|remainingMatrix|
	remainingMatrix := self remainingMatrixAfterProjecting: aTransitionList.
	self transitions: (self generateSum: (self project: aTransitionList)).
	^ super generateTensorSum: remainingMatrix
]

{ #category : #'as yet unclassified' }
KEDependentModelPart >> project: aTransitionList [
	"This function will project a transition rate matrix to the domain of this concern. The result is a transition rate matrix"
	|result domain selectedTrs|
	domain := self attributes keys first. 
	result := OrderedCollection new.
	
	selectedTrs := aTransitionList select: [ :tr| (tr from at: domain) ~= (tr to at: domain) ].
	selectedTrs isEmpty 
	ifTrue: [ 
		^ self error: 'The model have not contained the concern on which depends this concern.' ].
	(selectedTrs collect: [:e| (KETransition from: (Array with: (e from associationAt: domain)) to: (Array with: (e to associationAt: domain)) probability: e probability) ]) do: [ :e| 
		(result includes: e) ifFalse: [ result add: e ]	
	].
	^ result
]

{ #category : #'as yet unclassified' }
KEDependentModelPart >> remainingMatrixAfterProjecting: aTransitionList [
	|result domain selectedTrs|
	domain := self attributes keys first.
	result := OrderedCollection new.
	
	selectedTrs := aTransitionList select: [ :tr| 
		(tr from at: domain) = (tr to at: domain)
		].
	selectedTrs isEmpty ifTrue: [ 
		"generate a matrix zero for the remaining"
		|keys tmp|
		tmp := aTransitionList collect: [ :tr| 
			|e|
			e := KETransition from: tr from copy to: tr to copy probability: tr probability.
			e from removeKey: domain.
			e to removeKey: domain.
			e  ].
		keys := self generateKeys: tmp.
		keys do: [ :f| 
			result addAll: (keys collect: [:t| 
				KETransition from: f to: t probability: 0])].
		^ result
		].
	selectedTrs := selectedTrs collect: [ :tr| |e|
		e := KETransition from: tr from copy to: tr to copy probability: tr probability.
		e from removeKey: domain. 
		e to removeKey: domain.
		e ].
	selectedTrs do: [ :tr| 
		(result includes: tr) ifFalse: [ result add: tr ] ].
	^ result
]

{ #category : #operators }
KEDependentModelPart >> removeTransitionFrom: aCompartment to: anotherCompartment [
	self addTransitionFrom: aCompartment to: anotherCompartment probability: 0
]

{ #category : #operators }
KEDependentModelPart >> updateTransitionFrom: aCompartment to: anotherCompartment probability: aBlock [
	self addTransitionFrom: aCompartment to: anotherCompartment probability: aBlock
]
