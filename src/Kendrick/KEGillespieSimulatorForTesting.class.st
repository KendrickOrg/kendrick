Class {
	#name : #KEGillespieSimulatorForTesting,
	#superclass : #KEGillespieSimulator,
	#classInstVars : [
		'seed'
	],
	#category : 'Kendrick-InternalDSL'
}

{ #category : #'as yet unclassified' }
KEGillespieSimulatorForTesting class >> newSeed [

	seed :=  (Random new next * 1000000000) asInteger -> (Random new next * 1000000000) asInteger
]

{ #category : #'as yet unclassified' }
KEGillespieSimulatorForTesting class >> randPair [

	^ (Random new seed: seed key) -> (Random new seed: seed value)
]

{ #category : #'as yet unclassified' }
KEGillespieSimulatorForTesting class >> seed [

	^ seed
]

{ #category : #'as yet unclassified' }
KEGillespieSimulatorForTesting class >> seed: aPair [

	seed := aPair
]

{ #category : #'as yet unclassified' }
KEGillespieSimulatorForTesting >> executeOn: aModel [
	| rand1 rand2 t previousT randPair |
	super executeOn: aModel.
	t := tMin.
	previousT := t.
	randPair := self class randPair. "new generators with same seed (re-new controlled from class side)"
	rand1 := randPair key.
	rand2 := randPair value.
	self saveCompartmentsValueAtTime: tMin.

	[ t < tMax ]
		whileTrue: [ 
			| deltaT r1 r2 |
			r1 := rand1 next.
			r2 := rand2 next.
			deltaT := self doGillespieIteration: t randoms: (Array with: r1 with: r2).
			(deltaT = 0.0)
				ifTrue: [ ^ self ].
			t := t + deltaT.
			"Only store in the result from step to step"
			t > (previousT + step)
				ifTrue: [ 
					self saveCompartmentsValueAtTime: t.
					previousT := t ] ]
]
