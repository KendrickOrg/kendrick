"
The trait to define all the process (determinitic or stochastic)
"
Trait {
	#name : #KE2Process,
	#instVars : [
		't'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #accessing }
KE2Process >> t [
	^t
]

{ #category : #accessing }
KE2Process >> t: aNumber [
	t := aNumber
]
