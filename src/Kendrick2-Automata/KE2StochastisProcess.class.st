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
