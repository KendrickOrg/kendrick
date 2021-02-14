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
		"model parameters at: #scope put: tr scope.
		model parameters at: #contactingSource put: (tr from)."
		((tr from at: #status) = #empty)
		ifTrue: [ model currentCompartment: (tr to) ] 
		ifFalse: [ model currentCompartment: (tr from) ].
		model nextCompartment: (tr to).
		prob := (tr probability value: model) abs.
		"prob isDictionary ifTrue: [ prob := prob values sum ]."
		rate := prob * (model atCompartment: tr from).
		numPoisson := (PMPoissonGenerator lambda: (rate * step)) next.
		tr executeOn: model times: numPoisson   
		 ].
	
]

{ #category : #'as yet unclassified' }
KETauLeapSimulator >> executeOn: aModel [
	| t |
	super executeOn: aModel.
	self
		proportionalSelectionClass: StochasticAcceptanceProportionalSelection.
	t := tMin.
	self saveCompartmentsValueAtTime: tMin.
	[ t < tMax ]
		whileTrue: [ 
			model t: t. 
			self doTauLeapIteration.
			t := t + step.
			self saveCompartmentsValueAtTime: t ]
]

{ #category : #accessing }
KETauLeapSimulator >> proportionalSelectionClass: aClass [
	proportionalSelectionClass := aClass
]
