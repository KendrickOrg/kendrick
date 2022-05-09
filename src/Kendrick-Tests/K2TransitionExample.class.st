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
