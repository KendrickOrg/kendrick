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
KE2CTMCTest >> testValueAtCreationTimeIsZero [
         self assert: KE2CTMC new fromState equals: 0.
			self assert: KE2CTMC new toState equals: 0.
]
