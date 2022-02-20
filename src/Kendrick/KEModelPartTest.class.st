"
A KEConcernTest is a test class for testing the behavior of KEConcern
"
Class {
	#name : #KEModelPartTest,
	#superclass : #TestCase,
	#instVars : [
		'sirConcern'
	],
	#category : #'Kendrick-Examples-Core'
}

{ #category : #initialization }
KEModelPartTest >> setUp [
super setUp.
	sirConcern := KEModelPart new.
	sirConcern attributes: {(#status -> #(#S #I #R))}.
	sirConcern addParameters: {#beta . #gamma . #mu}.
	sirConcern addTransitionFrom: {(#status -> #S)} to: {(#status -> #I)} probability: [ :aModel | (aModel atParameter: #beta) * (aModel atCompartment: {(#status -> #I)}) ].
	sirConcern addTransitionFrom: {(#status -> #I)} to: {(#status -> #R)} probability: [ :aModel | aModel atParameter: #gamma ].
	sirConcern addTransitionFrom: {(#status -> #empty)} to: {(#status -> #S)} probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: {(#status -> #S)} to: {(#status -> #empty)} probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: {(#status -> #I)} to: {(#status -> #empty)} probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: {(#status -> #R)} to: {(#status -> #empty)} probability: [ :aModel | aModel atParameter: #mu ]
]

{ #category : #tests }
KEModelPartTest >> testAddAttributeValue [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	|c|
	c := KEModelPart new.
	c addAttribute: #species value: #(#mosquito #reservoir1 #reservoir2).
	self assert: c attributes size equals: 1
]

{ #category : #tests }
KEModelPartTest >> testAddParameter [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	|c|
	c := KEModelPart new.
	c addParameter: #beta.
	self assert: c parameters size equals: 1.
	^c
]

{ #category : #tests }
KEModelPartTest >> testAddParameterValue [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	|c|
	c := KEModelPart new.
	c addParameter: #beta value: 0.05.
	self assert: c parameters size equals: 1.
	^c
]

{ #category : #tests }
KEModelPartTest >> testAddParameters [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	|c|
	c := KEModelPart new.
	c addParameters: {#beta. #gamma}.
	self assert: c parameters size equals: 2.
	^c
]

{ #category : #tests }
KEModelPartTest >> testAddTransitionFromToProbability [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	|c|
	c := KEModelPart new.
	c addTransitionFrom: { #status->#I } to: { #status->#R } probability: 0.5.
	self assert: c transitions size equals: 1.
	^c
]

{ #category : #tests }
KEModelPartTest >> testAtAttributeAdd [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	|c|
	c := KEModelPart new.
	c addAttribute: #status value: #(S I).
	c atAttribute: #status add: #R.
	self assert: (c atAttribute: #status) size equals: 3.
	^c
	
]

{ #category : #tests }
KEModelPartTest >> testAttributes [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	| c |
	c := KEModelPart new.
	c attributes: {(#species -> #(s1 s2 s3))}.
	self assert: c attributes size equals: 1.
	^c
]

{ #category : #tests }
KEModelPartTest >> testCompartmentNames [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	|concern|
	concern := KEModelPart new.
	self assert: (concern finestCompartmentNames size) equals: 0.
	concern addAttribute: #species value: #(#mosquito #reservoir1 #reservoir2).
	self assert: (concern finestCompartmentNames size) equals: 3.
	self assert: (concern finestCompartmentNames first size) equals: 1.
	^concern 
]

{ #category : #tests }
KEModelPartTest >> testEquationsToTransitions [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	|c|
	c := KEModelPart new.
	c addEquation: 'S:t=mu*N-beta*S*I/N-mu*S'.
	c addEquation: 'I:t=beta*S*I/N-gamma*I-mu*I'.
	c addEquation: 'R:t=gamma*I-mu*R'.
	self assert: c transitions size equals: 6.
	^c
]

{ #category : #tests }
KEModelPartTest >> testGenerateTensorSum [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	| concern model |
	concern := KEModelPart new.
	concern addAttribute: #status value: #( S I R ).
	model := KEModel new.
	"model addAttribute: #species value: #(mosquito reservoir1 reservoir2)."
	concern
		addTransitionFrom: { (#status -> #S) }
		to: { (#status -> #I) }
		probability: [ :aModel | 
			(aModel atParameter: #beta)
			* (aModel atCompartment: { (#status -> #I) }) ].
	concern
		addTransitionFrom: { (#status -> #I) }
		to: { (#status -> #R) }
		probability: [ :aModel | aModel atParameter: #gamma ].
	self assert: model transitions size equals: 0.
	self
		assert: (concern generateTensorSum: model transitions) size
		equals: 2.
		
	^concern
]

{ #category : #tests }
KEModelPartTest >> testGenerateTensorSum2 [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	| concern model |
	concern := KEModelPart new.
	concern addAttribute: #status value: #( S I R ).
	model := KEModel new.
	model
		addAttribute: #species
		value: #( mosquito reservoir1 reservoir2 ).
	concern
		addTransitionFrom: { (#status -> #S) }
		to: { (#status -> #I) }
		probability: [ :aModel | 
			(aModel atParameter: #beta)
			* (aModel atCompartment: { (#status -> #I) }) ].
	concern
		addTransitionFrom: { (#status -> #I) }
		to: { (#status -> #R) }
		probability: [ :aModel | aModel atParameter: #gamma ].
	self assert: model transitions size equals: 9.
	self
		assert: (concern generateTensorSum: model transitions) size
		equals: 6.
		
	^concern 
]

{ #category : #tests }
KEModelPartTest >> testGenerateTransitionsFromAnd [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	|t keys concern|
	t := KETransition from: { #status->#S } to: { #status->#I } probability: [ :aModel| aModel atCompartment: { #status->#I } ].
	keys := { Dictionary newFrom: { #species->#mosquito }. Dictionary newFrom: { #species->#reservoir1 }. Dictionary newFrom: { #species->#reservoir2 } }.
	concern := KEModelPart new.
	self assert: (concern generateTransitionsFrom: t and: keys) size equals: 3.
	^concern 
]

{ #category : #tests }
KEModelPartTest >> testSplitStatus [
	<gtExample>
	<subjectClass: #KEModelPartTest>
	| twoStrains |
	twoStrains := sirConcern copy.
	twoStrains
		splitStatus:
			{#(I).
			(#strains -> #(1 2))}.
	self assert: (twoStrains atAttribute: #status) size equals: 5.
	self assert: twoStrains transitions size equals: 12.
	^twoStrains 
]
