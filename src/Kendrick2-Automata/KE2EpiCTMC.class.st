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
