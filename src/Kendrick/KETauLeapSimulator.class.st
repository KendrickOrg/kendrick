"
A KETauLeapSimulator improves the Gillespie's direct method by using the TauLeap algorithm - An algorithm in which the number of time for an event occurs is a Poisson distribution

"
Class {
	#name : #KETauLeapSimulator,
	#superclass : #KEStochasticSimulator,
	#instVars : [
		'proportionalSelectionClass'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #'as yet unclassified' }
KETauLeapSimulator >> doTauLeapIteration [
	
	model transitions do: [ :tr|
		|rate numPoisson prob|
		
		prob := (tr probability value: model) abs.
		rate := prob * (model atCompartment: tr from) atRandom.
		numPoisson := (PMPoissonGenerator lambda: (rate * step)) next.
		tr executeOn: model times: numPoisson   
		 ].
	
]

{ #category : #'as yet unclassified' }
KETauLeapSimulator >> executeOn: aModel [
	| t |
	super executeOn: aModel.
	t := tMin.
	self saveCompartmentsValueAtTime: tMin.
	[ t < tMax ]
		whileTrue: [ 
			model t: t. 
			self doTauLeapIteration.
			t := t + step.
			self saveCompartmentsValueAtTime: t ]
]
