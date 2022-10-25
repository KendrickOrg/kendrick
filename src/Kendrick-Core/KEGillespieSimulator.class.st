"
A KEGillespieSimulator use the Gillespie's direct algorithm for simulating the dynamics of the stochastic model.

"
Class {
	#name : #KEGillespieSimulator,
	#superclass : #KEStochasticSimulator,
	#instVars : [
		'rand1',
		'rand2',
		'proportionalSelectionClass'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #public }
KEGillespieSimulator >> doGillespieIteration [
	| rates deltaT chosen selection |
	rates := model rates.
	rates sum = 0
		ifTrue: [ ^ 0.0 ].
	deltaT := rand2 next ln negated / rates sum.
	selection := proportionalSelectionClass from: rates.
	selection normalize.
	chosen := selection sample.
	model executeEventAtRateIndex: chosen.
	^ deltaT
]

{ #category : #public }
KEGillespieSimulator >> executeOn: aModel [
	| t previousT |
	super executeOn: aModel.
	self
		proportionalSelectionClass: KEStochasticAcceptanceProportionalSelection.
	t := tMin.
	previousT := t.
	rand1 := Random new.
	rand2 := Random new.
	self saveCompartmentsValueAtTime: tMin.
	[ t < tMax ]
		whileTrue: [ | deltaT r1 r2 |
			r1 := rand1 next.
			r2 := rand2 next.
			model t: t.
			deltaT := self doGillespieIteration.
			deltaT = 0
				ifTrue: [ ^ self ].	"Stop the iteration if deltaT is zero"
			t := t + deltaT.
			"Only store in the result from step to step"
			t > (previousT + step)
				ifTrue: [ self saveCompartmentsValueAtTime: t.
					previousT := t ] ]
]

{ #category : #accessing }
KEGillespieSimulator >> proportionalSelectionClass: aClass [
	proportionalSelectionClass := aClass
]
