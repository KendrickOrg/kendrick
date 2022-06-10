"
This class contains event tests
"
Class {
	#name : #K2EventTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #tests }
K2EventTest >> testEvent [
   
	 <gtExample>
	| automaton stateS stateI stateR |
	automaton  := K2CTMC new.
	
	stateS := K2Event stateName: #S events: #(#eS).
	stateI := K2Event stateName: #I events: #(#eI).
	stateR := K2Event stateName: #R events: #(#eR).
	
	self assert: stateS events equals: #(#eS).
	self assert: stateI events equals: #(#eI).
	^automaton 
]
