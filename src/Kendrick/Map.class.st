Class {
	#name : #Map,
	#superclass : #KendrickInternalDSLEntities,
	#instVars : [
		'attributeToRegions',
		'borders'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
Map >> attributeToRegions [

	^ attributeToRegions 
]

{ #category : #'as yet unclassified' }
Map >> borders [

	^ borders
]

{ #category : #'as yet unclassified' }
Map >> borders: aMatrix [

	borders := aMatrix 
]

{ #category : #'as yet unclassified' }
Map >> for: aSymbolArray [

	attributeToRegions := aSymbolArray 
]
