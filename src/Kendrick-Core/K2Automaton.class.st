Class {
	#name : #K2Automaton,
	#superclass : #Object,
	#category : #'Kendrick-Core-MM2'
}

{ #category : #adding }
K2Automaton >> addTransition: aTransition [
	self subclassResponsibility 
]

{ #category : #adding }
K2Automaton >> addTransitionFrom: aState to: anotherState probability: aRate [
	self subclassResponsibility 
]

{ #category : #accessing }
K2Automaton >> attributes: attributesArray [
	self subclassResponsibility 
]
