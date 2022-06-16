Class {
	#name : #K2EventTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #tests }
K2EventTest >> testCreateAnEventThatAddAnIndividualFromSusceptibleState [
	<gtExample>
	|event|
	event := K2Event new.
	event addOneIndividualTo: #stateS.
	self assert: (event toState) equals: #stateS.
	^event
]

{ #category : #tests }
K2EventTest >> testCreateAnEventThatRemoveAnIndividualFromSusceptibleState [
	<gtExample>
	| event |
	event := K2Event new.
	event removeOneIndividualFrom: #stateS.
	self assert: (event fromState) equals: #stateS.
	^event 
]

{ #category : #tests }
K2EventTest >> testGenerateElementsOfEvents [ 

	 <gtExample>
	| stateS stateI|

	stateS := K2Event stateName: #S events: #(#eS).
	stateI := K2Event stateName: #I events: #(#eI).

	self assert: stateS stateName equals: #S.
	self assert: stateI events equals: #(#eI).
	^stateI
]
