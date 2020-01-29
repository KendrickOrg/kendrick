Class {
	#name : #KEContactNetworkNode,
	#superclass : #Mal2DGridNode,
	#instVars : [
		'currentStatus',
		'nextStatus',
		'genInfected'
	],
	#category : #'Kendrick-Core-Network'
}

{ #category : #accessing }
KEContactNetworkNode >> currentStatus [
	^ currentStatus
]

{ #category : #accessing }
KEContactNetworkNode >> currentStatus: aSymbol [
	currentStatus := aSymbol
]

{ #category : #accessing }
KEContactNetworkNode >> genInfected [
	^genInfected
]

{ #category : #accessing }
KEContactNetworkNode >> genInfected: aNumber [

genInfected := aNumber
]

{ #category : #initialization }
KEContactNetworkNode >> initialize [
	
]

{ #category : #accessing }
KEContactNetworkNode >> nextStatus: aSymbol [ 
	nextStatus := aSymbol
]

{ #category : #accessing }
KEContactNetworkNode >> updateStatus [

	currentStatus := nextStatus
]
