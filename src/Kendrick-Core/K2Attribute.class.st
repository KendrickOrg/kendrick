Class {
	#name : #K2Attribute,
	#superclass : #Object,
	#instVars : [
		'attribute'
	],
	#category : #'Kendrick-Core-MM2'
}

{ #category : #accessing }
K2Attribute >> atAttribute: aSymbol [
	^ attribute at: aSymbol
]

{ #category : #accessing }
K2Attribute >> atAttribute: aSymbol add: aValue [

	| newDomain |
	attribute
		at: aSymbol
		ifAbsent: [ ^ self error: 'Cannot find attribute ' , aSymbol asString ].
	newDomain := OrderedCollection new.
	newDomain addAll: (attribute at: aSymbol).
	newDomain add: aValue.
	attribute at: aSymbol put: newDomain
]

{ #category : #accessing }
K2Attribute >> attribute [

	^ attribute
]

{ #category : #accessing }
K2Attribute >> attribute: aAttribute [
	attribute := aAttribute 

	
]
