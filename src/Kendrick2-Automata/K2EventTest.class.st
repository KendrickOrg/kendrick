Class {
	#name : #K2EventTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

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
