Class {
	#name : #KECompartmentName,
	#superclass : #Object,
	#instVars : [
		'fullName'
	],
	#category : #'Kendrick-Tests-Core'
}

{ #category : #accessing }
KECompartmentName >> fullName [
	^ fullName
]

{ #category : #accessing }
KECompartmentName >> fullName: aName [

fullName := aName
]

{ #category : #'as yet unclassified' }
KECompartmentName >> simpleName: anArrayOfStrings withModel: aKEModel [


	fullName := anArrayOfStrings collect: [ :aString | 	| attributeName |
		            attributeName := aKEModel attributeFromValue: aString.
		            attributeName -> aString ]
]
