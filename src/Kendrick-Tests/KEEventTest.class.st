Class {
	#name : #KEEventTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEEventTest >> testCompareActionsOf2Events [
	| e1 e2 |
    e1 := KEEvent new fromStatus:#S; toStatus:#I.
	e2 := KEEvent new fromStatus: #S; toStatus:#I.
	
	self assert: e1 fromStatus equals: e2 fromStatus.
	self assert: e1 toStatus equals: e2 toStatus
]

{ #category : #tests }
KEEventTest >> testCreateAnEventThatAddAnIndividualFromStatusS [
	|e|
	e := KEEvent new.
	e addOneIndividualTo: #S.
	self assert: (e toStatus) equals: #S

]

{ #category : #tests }
KEEventTest >> testCreateAnEventThatRemoveAnIndividualFromStatusS [
	| e |
	e := KEEvent new.
	e removeOneIndividualFrom: #S.
	self assert: (e fromStatus) equals: #S
]

{ #category : #tests }
KEEventTest >> testEventsNumberOfTheSumfTwoConcernsAreTheProductOfTheirEventsNumber [

	| model model1 multiHostConcern |
	model1 := KEModelPart new.
	model1 addTransition: (KETransition
			 from: { (#status -> #S) }
			 to: { (#status -> #I) }
			 probability: 'beta*S*I' parseAsAnExpression).
	model1 addTransition: (KETransition
			 from: { (#status -> #I) }
			 to: { (#status -> #R) }
			 probability: 'gamma*I' parseAsAnExpression).
	multiHostConcern := KEModelPart new.
	multiHostConcern addAttribute: #species value: #( #human #bird ).
	model := KEModel new.
	model integrate: model1.
	model integrate: multiHostConcern.
	self
		assert: model generateEvents size
		equals:
		model1 generateEvents size * multiHostConcern generateEvents size
]

{ #category : #tests }
KEEventTest >> testEventsWithOppositeRate [

	| e1 e2 si s i beta minusBetaSI betaSI events |
	e1 := KEEvent new.
	e2 := KEEvent new.
	s := KEVariable new symbol: #S.
	i := KEVariable new symbol: #I.
	beta := KEVariable new symbol: #beta.
	si := s * i.
	betaSI := beta * si.
	minusBetaSI := betaSI negated.
	e1 rate: minusBetaSI normalize.
	e2 rate: betaSI normalize.
	events := OrderedCollection new.
	events add: e1.
	self
		assert: true
		equals: (e2 hasAnEventWithOppositeRateIn: events)
]

{ #category : #tests }
KEEventTest >> testEventsWithSameActions [
	| e1 e2 listEvents |
	e1 := KEEvent new
		fromStatus: #S;
		toStatus: #I.
	e2 := KEEvent new
		fromStatus: #S;
		toStatus: #I.
	listEvents := OrderedCollection new.
	listEvents add: e1.
	self
		assert: true
		equals: (e2 hasAnEventWithSameActionsIn: listEvents)
]

{ #category : #tests }
KEEventTest >> testODEDemographyModelHas6Events [
	| model |
	model := KEModelPart new.
	model attributes: {(#status -> #(#S #I #R))}.
	model addParameters: {#beta . #gamma . #mu}.
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S'.
	model addEquation: 'I:t=beta*S*I-gamma*I-mu*I'.
	model addEquation: 'R:t=gamma*I-mu*R'.
	self assert: model generateEvents size equals: 6
]

{ #category : #tests }
KEEventTest >> testVerifyNumberOfEventOfSumOfTwoConcerns [
<expectedFailure>
	| model model1 multiHostConcern |
	model1 := KEModelPart new.
	model1
		addTransition:
			(KETransition
				from: {(#status -> #S)}
				to: {(#status -> #I)}
				probability: 'beta*S*I' parseAsAnExpression).
	model1
		addTransition:
			(KETransition
				from: {(#status -> #I)}
				to: {(#status -> #R)}
				probability: 'gamma*I' parseAsAnExpression).
	multiHostConcern := KEModelPart new.
	multiHostConcern addAttribute: #species value: #(#human #bird).
	model := KEModel new.
	model integrate: model1.
	model integrate: multiHostConcern.
	self assert: model generateEvents size equals: 4
]
