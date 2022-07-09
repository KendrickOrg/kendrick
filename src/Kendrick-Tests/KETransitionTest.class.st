Class {
	#name : #KETransitionTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KETransitionTest >> testAsString [
	| aTransition |
	aTransition := KETransition from: {#status -> #S} to: {#status -> #I} probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	self assert: aTransition asString equals: 'From: {#status->#S} To: {#status->#I}'
]

{ #category : #tests }
KETransitionTest >> testAsStringWithEmptyCompartment [
	| aTransition |
	aTransition := KETransition from: {(#status -> #empty)} to: {#status -> #I} probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	self assert: aTransition asString equals: 'From: {#status->#empty} To: {#status->#I}'
]

{ #category : #tests }
KETransitionTest >> testEvaluateProbability [

	| transition model result |
	model := KEModel new.
	model attributes: { (#status -> #( S I R )) }.
	model atCompartment: { (#status -> #S) } put: 10000.
	model atCompartment: { (#status -> #I) } put: 1.
	model atCompartment: { (#status -> #R) } put: 0.
	model addParameters: { 
			(#beta -> 0.0052).
			(#gamma -> 52) }.
	transition := KETransition
		              from: { (#status -> #S) }
		              to: { (#status -> #I) }
		              probability: [ :fr :to :t | 
		              (model atParameter: #beta) * fr * to ].
	result := transition probability
		          value: (model atCompartment: transition from)
		          value: (model atCompartment: transition to)
		          value: 0.
	self assert: result equals: (model atParameter: #beta)
		* (model atCompartment: { (#status -> #S) })
]

{ #category : #tests }
KETransitionTest >> testExecuteTransition [
	| tr model |
	tr := KETransition from: {#status -> #S} to: {#status -> #I} probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	model := KEModel new.
	model attributes: {(#status -> #(S I R))}.
	model atCompartment: {(#status -> #S)} put: 10000.
	model atCompartment: {(#status -> #I)} put: 1.
	model atCompartment: {(#status -> #R)} put: 0.
	model
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)}.
	tr executeOn: model times: 1.
	self assert: (model atCompartment: {(#status -> #S)}) equals: 9999.
	self assert: (model atCompartment: {(#status -> #I)}) equals: 2
]

{ #category : #tests }
KETransitionTest >> testFromAsString [
	| aTransition from to|
	from := '{#status: #S}'.
	to := '{#status: #I}'.
	aTransition := KETransition from: from to: to probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	self assert: aTransition asString equals: 'From: {#status->#S} To: {#status->#I}'
]
