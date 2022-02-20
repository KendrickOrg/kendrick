Class {
	#name : #KETransitionTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Examples-Core'
}

{ #category : #tests }
KETransitionTest >> testAsString [
	<gtExample>
	<subjectClass: #KETransitionTest>
	| aTransition |
	aTransition := KETransition from: {#status -> #S} to: {#status -> #I} probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	self assert: aTransition asString equals: 'From: {#status->#S} To: {#status->#I}'.
	^aTransition 
]

{ #category : #tests }
KETransitionTest >> testAsStringWithEmptyCompartment [
	<gtExample>
	<subjectClass: #KETransitionTest>
	| aTransition |
	aTransition := KETransition from: {(#status -> #empty)} to: {#status -> #I} probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	self assert: aTransition asString equals: 'From: {#status->#empty} To: {#status->#I}'.
	^aTransition 
]

{ #category : #tests }
KETransitionTest >> testEvaluateProbability [
	<gtExample>
	<subjectClass: #KETransitionTest>
	| tr model rs |
	model := KEModel new.
	model attributes: {(#status -> #(S I R))}.
	model atCompartment: {(#status -> #S)} put: 10000 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	tr := KETransition from: {#status -> #S} to: {#status -> #I} probability: [ :fr :to :t | (model atParameter: #beta) * fr * to ].
	model
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)}.
	rs := tr probability value: (model atCompartment: tr from) value: (model atCompartment: tr to) value: 0.
	self assert: rs equals: 52.
	^model
	
]

{ #category : #tests }
KETransitionTest >> testExecuteTransition [
	<gtExample>
	<subjectClass: #KETransitionTest>
	| tr model |
	tr := KETransition from: {#status -> #S} to: {#status -> #I} probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	model := KEModel new.
	model attributes: {(#status -> #(S I R))}.
	model atCompartment: {(#status -> #S)} put: 10000 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	model
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)}.
	tr executeOn: model times: 1.
	self assert: (model atCompartment: {(#status -> #S)}) equals: 9999.
	self assert: (model atCompartment: {(#status -> #I)}) equals: 2.
	^model
]

{ #category : #tests }
KETransitionTest >> testFromAsString [
	<gtExample>
	<subjectClass: #KETransitionTest>
	| aTransition from to|
	from := '{#status: #S}'.
	to := '{#status: #I}'.
	aTransition := KETransition from: from to: to probability: [ :f :t :m | (m atParameter: #beta) * f * t ].
	self assert: aTransition asString equals: 'From: {#status->#S} To: {#status->#I}'.
	^aTransition 
]
