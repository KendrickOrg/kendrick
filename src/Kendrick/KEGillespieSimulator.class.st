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
	| rates deltaT chosen transitions |
	model t: t.
	transitions := model transitions.
	rates := transitions
		collect: [ :tr | 
			| prob |
			(tr from at: #status) = #empty
				ifTrue: [ model currentCompartment: tr to ]
				ifFalse: [ model currentCompartment: tr from ].
			model nextCompartment: tr to.
			prob := (tr probability value: model) abs.
			prob * (model atCompartment: tr from) ].
	rates sum = 0
		ifTrue: [ ^ 0.0 ].
	deltaT := rand2 next ln negated / rates sum.
	chosen := self rouletteWheelSelectAmong: rates.
	(transitions at: chosen) executeOn: model times: 1.
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
			deltaT := self doGillespieIteration: t.
			deltaT = 0
				ifTrue: [ ^ self ]. "Stop the iteration if deltaT is zero"
			t := t + deltaT.
			"Only store in the result from step to step"
			t > (previousT + step)
				ifTrue: [ self saveCompartmentsValueAtTime: t.
					previousT := t ] ]
]

{ #category : #public }
KEGillespieSimulator >> rouletteWheelSelectAmong: rates [
	"Step 6 of the Gillespie's direct algorithm
	Implementation of the roulette wheel selection
	also called fitness proportionate selection in GA
	https://en.wikipedia.org/wiki/Fitness_proportionate_selection
	We are using here a linear walk, a bisecting walk would be faster.
	"

	| sum accumulator r proportion |
	r := rand1 next.
	sum := rates sum.
	proportion := sum * r.
	accumulator := 0.
	rates
		doWithIndex: [ :each :i | 
			accumulator := accumulator + each.
			accumulator >= proportion
				ifTrue: [ ^ i ] ]
]
