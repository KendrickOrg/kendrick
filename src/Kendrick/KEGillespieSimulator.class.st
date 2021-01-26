"
A KEGillespieSimulator use the Gillespie's direct algorithm for simulating the dynamics of the stochastic model.

"
Class {
	#name : #KEGillespieSimulator,
	#superclass : #KEStochasticSimulator,
	#instVars : [
		'rand1',
		'rand2'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #public }
KEGillespieSimulator >> doGillespieIteration: t [
	| rates deltaT chosen |
	rates := OrderedCollection new.
	model t: t.
	model transitions
		do: [ :tr | 
			| prob |
			(tr from at: #status) = #empty
				ifTrue: [ model currentCompartment: tr to ]
				ifFalse: [ model currentCompartment: tr from ].
			model nextCompartment: tr to.
			prob := (tr probability value: model) abs.
			rates add: prob * (model atCompartment: tr from) ].
	rates sum = 0
		ifTrue: [ ^ 0.0 ].
	deltaT := rand2 next ln negated / rates sum.
	chosen := self rouletteWheelSelectAmong: rates.
	(model transitions at: chosen) executeOn: model times: 1.
	^ deltaT
]

{ #category : #public }
KEGillespieSimulator >> executeOn: aModel [
	| t previousT |
	super executeOn: aModel.
	t := tMin.
	previousT := t.
	rand1 := Random new.
	rand2 := Random new.
	self saveCompartmentsValueAtTime: tMin.
	[ t < tMax ]
		whileTrue: [ | deltaT r1 r2 |
			r1 := rand1 next.
			r2 := rand2 next.
			deltaT := self
				doGillespieIteration: t.
			deltaT = 0.0
				ifTrue: [ ^ self ].
			t := t + deltaT.
			"Only store in the result from step to step"
			t > (previousT + step)
				ifTrue: [ self saveCompartmentsValueAtTime: t.
					previousT := t ] ]
]

{ #category : #public }
KEGillespieSimulator >> rouletteWheelSelectAmong: rates [
	"Step 6 of the Gillespie's direct algorithm
	Implementation of the roulette wheel selection"

	| sum count r |
	r := rand1 next.
	sum := rates sum.
	count := 0.
	1 to: rates size do: [ :i | 
		count := count + (rates at: i).
		count >= (sum * r)
			ifTrue: [ ^ i ] ]
]
