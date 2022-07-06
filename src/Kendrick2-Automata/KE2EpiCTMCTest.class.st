Class {
	#name : #KE2EpiCTMCTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #tests }
KE2EpiCTMCTest >> testReturnInitialTimeOfSISCTMCModel [
	
	| sisModel |
	sisModel := KE2EpiCTMC new.
	sisModel addAttribute: #status value: #(S I).
	sisModel atState: {(#status -> #S)} put: 99 atOthersPut: 0.
	sisModel atState: {(#status -> #I)} put: 1.
	sisModel
		addParameters:
			{(#beta -> 1.4247).
			(#gamma -> 0.1429).
			(#N -> 100).}.
	sisModel
		addTransitionFromState: {(#status -> #S)}
		toState: {(#status -> #I)}
		rate: [ :m | (m atParameter: #beta) * (m atState: {(#status -> #I)}) / (m atParameter: #N) ].
	sisModel
		addTransitionFromState: {(#status -> #I)}
		toState: {(#status -> #S)}
		rate: [ :m | m atParameter: #gamma ].
		
	self assert: (sisModel t) equals: 0. 
]

{ #category : #tests }
KE2EpiCTMCTest >> testReturnRatesOfSISCTMCModel [
	
	| sisModel ratesOfModel|
	sisModel := KE2EpiCTMC new.
	sisModel addAttribute: #status value: #(S I).
	sisModel atState: {(#status -> #S)} put: 99 atOthersPut: 0.
	sisModel atState: {(#status -> #I)} put: 1.
	sisModel
		addParameters:
			{(#beta -> 1.4247).
			(#gamma -> 0.1429).
			(#N -> 100).}.
	sisModel
		addTransitionFromState: {(#status -> #S)}
		toState: {(#status -> #I)}
		rate: [ :m | (m atParameter: #beta) * (m atState: {(#status -> #I)}) / (m atParameter: #N) ].
	sisModel
		addTransitionFromState: {(#status -> #I)}
		toState: {(#status -> #S)}
		rate: [ :m | m atParameter: #gamma ].
		
	ratesOfModel := #(1.4104530000000002 0.1429) asOrderedCollection.
		
	self assert: (sisModel rates) equals: ratesOfModel 
]

{ #category : #tests }
KE2EpiCTMCTest >> testReturnStateAndCardinalitiesOfSISCTMCModel [

	| sisModel stateAndCardinality|
	sisModel := KE2EpiCTMC new.
	sisModel addAttribute: #status value: #(S I).
	sisModel atState: {(#status -> #S)} put: 99 atOthersPut: 0.
	sisModel atState: {(#status -> #I)} put: 1.
	sisModel
		addParameters:
			{(#beta -> 1.4247).
			(#gamma -> 0.1429).
			(#N -> 100).}.
	sisModel
		addTransitionFromState: {(#status -> #S)}
		toState: {(#status -> #I)}
		rate: [ :m | (m atParameter: #beta) * (m atState: {(#status -> #I)}) / (m atParameter: #N) ].
	sisModel
		addTransitionFromState: {(#status -> #I)}
		toState: {(#status -> #S)}
		rate: [ :m | m atParameter: #gamma ].
		
	stateAndCardinality := sisModel states.
	
	self assert: (sisModel executeEventAtRateIndex: 1) equals: stateAndCardinality.	
	self assert: (sisModel executeEventAtRateIndex: 2) equals: stateAndCardinality
]
