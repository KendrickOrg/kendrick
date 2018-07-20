"
A KEIndividualBasedSimulator simulates the input model at the individual-level.

"
Class {
	#name : #KEIndividualBasedSimulator,
	#superclass : #KEStochasticSimulator,
	#instVars : [
		'birthTransitions',
		'transitions',
		'transitionNbExecutions'
	],
	#category : #'Kendrick-Core'
}

{ #category : #accessing }
KEIndividualBasedSimulator >> birthTransitions [
	birthTransitions ifNil: [ 
		birthTransitions := OrderedCollection new.
		1 to: model transitions size do: [ :i| |tr| tr := model transitions at: i.
			((tr from at: #status) = #empty) ifTrue: [ 
				"tr rate ifNotNil: [ tr rate: (tr rate remove: (KEVariable new symbol: #N)) ]."
				birthTransitions add: (tr->i) ] ]
		 ].
	^ birthTransitions 
]

{ #category : #'as yet unclassified' }
KEIndividualBasedSimulator >> calProb: ind random: rand [
	|rate prob events|
	events := self transitions at: ind currentStatus ifAbsent: [OrderedCollection new].
	"Choose an event for execute on this individual"
	1 to: events size do: [ :e||l|
		"((events at: e) key from = #empty)
		ifTrue: [ model parameters at: #inProcessingCompartment put: ((events at: e) key to) ] 
		ifFalse: [ model parameters at: #inProcessingCompartment put: ((events at: e) key from) ]".
		l := ind currentStatus copy.
		l at: #id put: (ind id).
		model currentCompartment: l.
		model nextCompartment: ((events at: e) key to).
		rate := ((events at: e) key probability value: model) abs.
		"rate isDictionary ifTrue: [ rate := rate values sum ]."
		prob := 1 - (((step * rate) negated) exp).
		(prob > (rand next)) ifTrue: [ |oldTimes|
			ind nextStatus: ((events at: e) key to).
			oldTimes := self transitionNbExecutions at: (events at: e) value.
			^ (self transitionNbExecutions at: (events at: e) value put: (oldTimes + 1))
		].
	 ]
	
	
]

{ #category : #'as yet unclassified' }
KEIndividualBasedSimulator >> doBirthTransitions [
	"|rand|
	rand := Random new."
	self birthTransitions do: [ :e|
		|r p| 
		"model parameters at: #scope put: e key scope.
		model parameters at: #contactingSource put: (e key from)."
		"(e key from = #empty)
		ifTrue: [ model parameters at: #inProcessingCompartment put: (e key to) ] 
		ifFalse: [ model parameters at: #inProcessingCompartment put: (e key from) ]."
		model currentCompartment: (e key to).
		r := (e key probability value: model) abs.
		"r isDictionary ifTrue: [ r := r values sum ]."
		"p := 1 - (((r * step) negated) exp).
		(p > (rand next)) ifTrue: [  
			|newInd oldTimes|
			newInd := KEIndividual new.
			newInd currentStatus: e key to.
			newInd updateAttributes: e key to.
			newInd nextStatus: nil.
			model population addIndividual: newInd.
			oldTimes := self transitionNbExecutions at: e value.
			self transitionNbExecutions at: e value put: (oldTimes + 1)
			]"
		r := r * (model atCompartment: e key from).
		p := (PoissonGenerator lambda: (r * step)) next.
		1 to: p do: [ :i||newInd|
			newInd := KEIndividual new.
			newInd currentStatus: e key to.
			newInd updateAttributes: e key to.
			newInd nextStatus: nil.
			model population addIndividual: newInd.
			 ].
		self transitionNbExecutions at: e value put: p
		]
	
]

{ #category : #'as yet unclassified' }
KEIndividualBasedSimulator >> doIBMIteration: t random: rand [
	model t: t.
	(model population individuals select: [ :ind | ind isAlive ]) do: [ :ind | self calProb: ind random: rand ].
	self doBirthTransitions
]

{ #category : #public }
KEIndividualBasedSimulator >> executeOn: aModel [
	| t rand |
	super executeOn: aModel.
	t := tMin.
	self saveCompartmentsValueAtTime: tMin.
	rand := Random new.
	[ t < tMax ]
		whileTrue: [ 
			self doIBMIteration: t random: rand.
			self updateIndividuals.
			t := t + step.
			self saveCompartmentsValueAtTime: t ]
]

{ #category : #accessing }
KEIndividualBasedSimulator >> transitionNbExecutions [
	transitionNbExecutions ifNil: [ transitionNbExecutions := OrderedCollection new.
		model transitions do: [ :i| transitionNbExecutions add: 0 ]
		 ].
	^ transitionNbExecutions 
]

{ #category : #accessing }
KEIndividualBasedSimulator >> transitions [
	transitions ifNil: [ 
		transitions := Dictionary new.
		1 to: model transitions size do: [ :i||tr|
			tr := model transitions at: i.
			((tr from at: #status) ~= #empty) ifTrue: [ transitions at: tr from ifAbsentPut: OrderedCollection new.
				(transitions at: tr from) add: (tr->i)
				 ]
			 ]
		 ].
	^ transitions
]

{ #category : #'as yet unclassified' }
KEIndividualBasedSimulator >> updateIndividuals [
	"Update status for individuals of population"
	model population individuals do: [ :ind| 
		(ind isAlive and: [ ind nextStatus isNotNil ]) 
		ifTrue: [ 
			((ind nextStatus at: #status) = #empty) 
			ifTrue: [ model population removeIndividual: ind ] 
			ifFalse: [ 
				model population updateIndividual: ind ]
			 ]
		].
	"Update compartments'size"

	1 to: model transitions size do: [ :i|
		|tr|
		tr := model transitions at: i.
		tr executeOn: model times: (self transitionNbExecutions at: i).
		self transitionNbExecutions at: i put: 0
		 ]
	
]
