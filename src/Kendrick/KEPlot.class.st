Class {
	#name : #KEPlot,
	#superclass : #KEEntity,
	#instVars : [
		'data'
	],
	#category : #'Kendrick-Core-Visualisation-Roassal3'
}

{ #category : #accessing }
KEPlot >> data [ 
	^data 
]

{ #category : #accessing }
KEPlot >> data: aCollection [
	data := aCollection
]

{ #category : #initialization }
KEPlot >> initialize [
	data := OrderedCollection new
]

{ #category : #accessing }
KEPlot >> view [
	self subclassResponsibility
]
