Class {
	#name : #KE2Population,
	#superclass : #Object,
	#instVars : [
		'states'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #initialization }
KE2Population >> initialize [
	states := Dictionary new
]

{ #category : #accessing }
KE2Population >> size [
	states ifEmpty:  [ ^ 0 ].
	^ states sum
]
