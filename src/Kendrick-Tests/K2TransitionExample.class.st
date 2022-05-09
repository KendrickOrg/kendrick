Class {
	#name : #K2TransitionExample,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-MM2'
}

{ #category : #tests }
K2TransitionExample >> testAsStringExample [

	<gtExample>
	| aTransition |
	aTransition := K2Transition  from: {#aState -> #S} to: {#aState -> #I} probability: 'lambda'.
	self assert: aTransition asString equals: 'From: {#aState->#S} To: {#aState->#I}'.
	^ aTransition 
]

{ #category : #tests }
K2TransitionExample >> testAsStringFinalStateIsEmptyExample [

	<gtExample>
	| aTransition |
	aTransition := K2Transition  from: {#aState -> #S} to: {#aState -> #Empty} probability: 'mu'.
	self assert: aTransition asString equals: 'From: {#aState->#S} To: {#aState->#Empty}'.
	^ aTransition 
]

{ #category : #tests }
K2TransitionExample >> testAsStringWithEmptyStateExample [

	<gtExample>
	| aTransition |
	aTransition := K2Transition from: {(#aState -> #empty)} to: {#aState -> #I} probability: 'mu'.
	self assert: aTransition asString equals: 'From: {#aState->#empty} To: {#aState->#I}'.
	^ aTransition 
]

{ #category : #tests }
K2TransitionExample >> testFromAsStringExample [

	<gtExample>
	| aTransition initialState finalState|
	initialState := '{#aState: #S}'.
	finalState := '{#aState: #I}'.
	aTransition := K2Transition from: initialState  to: finalState probability: 'lambda'.
	self assert: aTransition asString equals: 'From: {#aState->#S} To: {#aState->#I}'.
	^aTransition 
]
