"
A KEModelPart represents a concern of epidemiology. It contains  a list of attributes, parameters and transitions. We may define the transitions of a concern through a system of equations.

Instance Variables
	attributes:		<Object>
	equations:		<Object>
	parameters:		<Object>
	transitions:		<Object>

attributes
	- xxxxx

equations
	- xxxxx

parameters
	- xxxxx

transitions
	- xxxxx

"
Class {
	#name : #KEModelPart,
	#superclass : #KEComponent,
	#category : #'Kendrick-Core'
}

{ #category : #'as yet unclassified' }
KEModelPart class >> dependOn: aConcern [
	|c|
	c := KEDependentModelPart new.
	c attributes: aConcern attributes.
	^ c
]

{ #category : #'as yet unclassified' }
KEModelPart class >> extends: aConcern [
	|c|
	c := KEModelPart new.
	c clones: aConcern.
	^ c
]

{ #category : #parameters }
KEModelPart >> addParameter: aSymbol [
	"Apparently this is possible to have parameter with un-initialized value in KEModelPart (concern) but not for KEModel"

	self addParameter: aSymbol value: nil
]

{ #category : #parameters }
KEModelPart >> addParameters: collectionOfParameters [
	collectionOfParameters do: [ :p | self addParameter: p ]
]

{ #category : #general }
KEModelPart >> clones: aConcern [
	self transitions: aConcern transitions.
	attributes := Dictionary new.
	aConcern attributes keysAndValuesDo: [ :k :v| 
		attributes at: k put: v
		].
	parameters := Dictionary new.
	aConcern parameters keysAndValuesDo: [ :k :v| 
		parameters at: k put: v
		].
]

{ #category : #general }
KEModelPart >> generateKeys: aTransitionList [
	|tmp|
	tmp := Dictionary new.
	aTransitionList do: [ :t| 
		tmp at: t from put: 0.
		tmp at: t to put: 0.	
	].
	^ tmp keys

]

{ #category : #operators }
KEModelPart >> generateTensorSum: aTransitionList [
	|result keys|
	result := OrderedCollection new.
	keys := self generateKeys: aTransitionList.
	(self transitions select: [ :t| t probability ~= 0 ]) do: [ :t| 
		result addAll: (self generateTransitionsFrom: t and: keys)	
	].
	keys := self generateKeys: (self transitions).
	(aTransitionList select: [ :t| t probability ~= 0 ]) do: [ :t|
		result addAll: (self generateTransitionsFrom: t and: keys)
	].
	^ result
]

{ #category : #general }
KEModelPart >> generateTransitionsFrom: t and: keys [
	|result|
	result := OrderedCollection new.
	keys isEmpty
	ifTrue: [ result add: t ]
	ifFalse: [ 
		(keys select: [ :k| (k values includes: #empty) not ]) do: [ :k|
			|tmp from to|
			tmp := k copy.
			t from keysAndValuesDo: [ :kt :vt| tmp at: kt put: vt ]. 
			from := tmp copy.
			t to keysAndValuesDo: [ :kt :vt| tmp at: kt put: vt ]. 
			to := tmp copy.
			result add: (KETransition from: from to: to probability: t probability) 
	] ].
	^ result

]

{ #category : #operators }
KEModelPart >> splitStatus: inputs [
	| anArrayOfSymbol key newStatus trans tmp |
	anArrayOfSymbol := inputs first.
	key := inputs second key.
	newStatus := inputs second value.
	anArrayOfSymbol = #all
		ifTrue: [ ^ self splitStatus: (self atAttribute: #status) ].
	anArrayOfSymbol
		ifNil: [ ^ self error: 'Concern does not contains status attribute' ].
	newStatus
		do: [ :v | 
			anArrayOfSymbol
				do:
					[ :k | self atAttribute: #status add: (k asString , v asString) asSymbol ] ].
	tmp := Dictionary
		newFrom:
			(anArrayOfSymbol
				collect:
					[ :e | e -> (newStatus collect: [ :v | (e asString , v asString) asSymbol ]) ]).
	trans := self transitions
		select: [ :tr | 
			(anArrayOfSymbol includes: (tr from at: #status))
				| (anArrayOfSymbol includes: (tr to at: #status)) ].
	trans isEmpty
		ifTrue: [ ^ self error: 'There are no transitions to do split' ].
	trans
		do: [ :tr | 
			| trs |
			trs := OrderedCollection new.
			(anArrayOfSymbol includes: (tr from at: #status))
				ifTrue: [ (anArrayOfSymbol includes: (tr to at: #status))
						ifTrue: [ 1 to: newStatus size do: [ :i | 
								| newTr |
								newTr := KETransition
									from: tr from copy
									to: tr to copy
									probability: tr probability.
								newTr from
									at: #status
									put: ((tmp at: (tr from at: #status)) at: i).
								newTr to
									at: #status
									put: ((tmp at: (tr to at: #status)) at: i).
								trs add: newTr ] ]
						ifFalse: [ trs
								addAll:
									((tmp at: (tr from at: #status))
										collect: [ :each | 
											| newTr |
											newTr := KETransition
												from: tr from copy
												to: tr to copy
												probability: tr probability.
											newTr from at: #status put: each.
											newTr ]) ] ]
				ifFalse: [ trs
						addAll:
							((tmp at: (tr to at: #status))
								collect: [ :each | 
									| newTr |
									newTr := KETransition
										from: tr from copy
										to: tr to copy
										probability: tr probability.
									newTr to at: #status put: each.
									newTr ]) ].
			self transitions addAll: trs.
			tr probability: 0 ]
]
