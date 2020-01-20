"
A KEGillespieSimulator use the Gillespie's direct algorithm for simulating the dynamics of the stochastic model.

"
Class {
	#name : #KEGillespieSimulator,
	#superclass : #KEStochasticSimulator,
	#category : #'Kendrick-Core'
}

{ #category : #'as yet unclassified' }
KEGillespieSimulator >> doGillespieIteration: t randoms: rands [
	|rates deltaT chosen|
	rates := OrderedCollection new.
	model t: t.
	model transitions do: [ :tr| 
		|prob|
		((tr from at: #status) = #empty)
		ifTrue: [ model currentCompartment: (tr to) ] 
		ifFalse: [ model currentCompartment: (tr from) ].
		model nextCompartment: (tr to).
		prob := (tr probability value: model) abs.
		rates add: (prob * (model atCompartment: tr from)) 
		].
	(rates sum) = 0 ifTrue: [ ^ 0.0 ].
	deltaT := (((rands second) ln) negated) / (rates sum).
	chosen := self random: (rands first) select: rates.
	(model transitions at: chosen) executeOn: model times: 1.
	^ deltaT
]

{ #category : #public }
KEGillespieSimulator >> executeOn: aModel [
	| rand1 rand2 t previousT |
	super executeOn: aModel.
	t := tMin.
	previousT := t.
	rand1 := Random new.
	rand2 := Random new.
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

{ #category : #'as yet unclassified' }
KEGillespieSimulator >> random: rand select: rates [
	|sum count|
	sum := rates sum.
	count := 0.
	1 to: rates size do: [ :i|
		count := count + (rates at: i).
		count >= (sum * rand) ifTrue: [ ^ i ]
		 ].
	^ 0
]
