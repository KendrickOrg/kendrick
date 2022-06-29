Class {
	#name : #KE2CTMCTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #tests }
KE2CTMCTest >> testCountStateOfCTMCIsSetAndRead [
	| c |
	c := KE2CTMC new.
	c toState: 1.
	c fromState: 1.
	self assert: c toState  equals:  1.
	self assert: c fromState equals: 1.
]

{ #category : #tests }
KE2CTMCTest >> testDecrementAndIncrementStateOfCTMC [
	| model1 model2|
	
	
	model1 := KE2CTMC new.
	model1 fromState: 3 toState: 2 rate: 2.
	
	self assert: (model1 toState) equals:  3.
	self assert: (model1 fromState) equals:  2.
	self assert: (model1 rate) equals: 2.
	
	model2 := KE2CTMC new.
	model2 fromState: 5 toState: 3 rate: 1.
	self assert: (model2 toState) equals:  4.
	self assert: (model2 fromState) equals:  4.
	self assert: (model2 rate) equals: 1.
]

{ #category : #tests }
KE2CTMCTest >> testValueAtCreationTimeIsZero [
         self assert: KE2CTMC new fromState equals: 0.
			self assert: KE2CTMC new toState equals: 0.
]
