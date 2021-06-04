Class {
	#name : #KECompartmentName,
	#superclass : #Object,
	#instVars : [
		'fullName'
	],
	#category : #'Kendrick-Core'
}

{ #category : #'as yet unclassified' }
KECompartmentName >> = aKECompartmentName [

	^ self fullName = aKECompartmentName fullName
]

{ #category : #accessing }
KECompartmentName >> fullName [
	^ fullName
]

{ #category : #'as yet unclassified' }
KECompartmentName >> simpleName: anArrayOfStrings withModel: aKEModel [

	fullName := anArrayOfStrings collect: [ :aString | 
		            | attributeName |
		            attributeName := aKEModel attributeFromValue: aString.
		            attributeName -> aString ].
	"Save the names following the order of attributes"
	fullName := fullName sorted: [ :x :y | 
		            (aKEModel attributes keys indexOf: x key)
		            <= (aKEModel attributes keys indexOf: y key) ]
]
