"
I'm the abstract class of Automaton
"
Class {
	#name : #K2Automaton,
	#superclass : #Object,
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #stepping }
K2Automaton >> step [

	"Performs a single step on the automaton changing its current state."

	self subclassResponsibility
]
