Class {
	#name : #KECompartmentName,
	#superclass : #KEEntity,
	#instVars : [
		'fullName'
	],
	#category : #'Kendrick-Core'
}

{ #category : #comparing }
KECompartmentName >> = aKECompartmentName [

	self fullName with: aKECompartmentName fullName do: [ :e1 :e2 | 
		e1 = e2 ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
KECompartmentName >> fullName [
	^ fullName
]

{ #category : #comparing }
KECompartmentName >> hash [ 
^ fullName hash
]

{ #category : #'as yet unclassified' }
KECompartmentName >> simpleName: anArrayOfStrings withModel: aKEModel [

	fullName := anArrayOfStrings collect: [ :aString | 
		            | attributeName |
		            attributeName := aKEModel attributeFromValue: aString.
		            attributeName -> aString ].
	
	"Save the names following the order of attributes"
	"keys on Dictionary returns an array that follows their introduction in the dictionary"
	fullName := fullName sorted: [ :x :y | 
		            (aKEModel attributes keys indexOf: x key)
		            <= (aKEModel attributes keys indexOf: y key) ]
]
