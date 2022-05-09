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
K2Attribute >> attribute: aAttribute [
	attribute := aAttribute 

	
]
