"
A KEConcernTest is a test class for testing the behavior of KEConcern
"
Class {
	#name : #KEModelPartTest,
	#superclass : #TestCase,
	#instVars : [
		'sirConcern'
	],
	#category : #'Kendrick-Tests-Core'
}

{ #category : #initialization }
KEModelPartTest >> setUp [
super setUp.
	sirConcern := KEModelPart new.
	sirConcern attributes: {(#status -> #(#S #I #R))}.
	sirConcern addParameters: {#beta . #gamma . #mu}.
	sirConcern addTransitionFrom: {(#status -> #S)} to: {(#status -> #I)} probability: [ :aModel | (aModel atParameter: #beta) * (aModel atCompartment: {(#status -> #I)}) ].
	sirConcern addTransitionFrom: {(#status -> #I)} to: {(#status -> #R)} probability: [ :aModel | aModel atParameter: #gamma ].
	sirConcern addTransitionFrom: #empty to: {(#status -> #S)} probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: {(#status -> #S)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: {(#status -> #I)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: {(#status -> #R)} to: #empty probability: [ :aModel | aModel atParameter: #mu ]
]

{ #category : #tests }
KEModelPartTest >> testAddAttributeValue [
	|c|
	c := KEModelPart new.
	c addAttribute: #species value: #(#mosquito #reservoir1 #reservoir2).
	self assert: c attributes size equals: 1
]

{ #category : #tests }
KEModelPartTest >> testAddParameter [
	|c|
	c := KEModelPart new.
	c addParameter: #beta.
	self assert: c parameters size equals: 1
]

{ #category : #tests }
KEModelPartTest >> testAddParameterValue [
	|c|
	c := KEModelPart new.
	c addParameter: #beta value: 0.05.
	self assert: c parameters size equals: 1
]

{ #category : #tests }
KEModelPartTest >> testAddParameters [
	|c|
	c := KEModelPart new.
	c addParameters: {#beta. #gamma}.
	self assert: c parameters size equals: 2
]

{ #category : #tests }
KEModelPartTest >> testAddTransitionFromToProbability [
	|c|
	c := KEModelPart new.
	c addTransitionFrom: { #status->#I } to: { #status->#R } probability: 0.5.
	self assert: c transitions size equals: 1
]

{ #category : #tests }
KEModelPartTest >> testAtAttributeAdd [
	|c|
	c := KEModelPart new.
	c addAttribute: #status value: #(S I).
	c atAttribute: #status add: #R.
	self assert: (c atAttribute: #status) size equals: 3 
]

{ #category : #tests }
KEModelPartTest >> testAttributes [
	| c |
	c := KEModelPart new.
	c attributes: {(#species -> #(s1 s2 s3))}.
	self assert: c attributes size equals: 1
]

{ #category : #tests }
KEModelPartTest >> testCompartmentNames [
	|concern|
	concern := KEModelPart new.
	self assert: (concern compartmentNames size) equals: 0.
	concern addAttribute: #species value: #(#mosquito #reservoir1 #reservoir2).
	self assert: (concern compartmentNames size) equals: 3.
	self assert: (concern compartmentNames first size) equals: 1
]

{ #category : #tests }
KEModelPartTest >> testEquationsToTransitions [
	|c|
	c := KEModelPart new.
	c addEquation: 'S:t=mu*N-beta*S*I/N-mu*S'.
	c addEquation: 'I:t=beta*S*I/N-gamma*I-mu*I'.
	c addEquation: 'R:t=gamma*I-mu*R'.
	self assert: c transitions size equals: 6.
]

{ #category : #tests }
KEModelPartTest >> testGenerateTensorSum [
	|concern model|
	concern := KEModelPart new.
	concern addAttribute: #status value: #(S I R).
	model := KEModel new.
	"model addAttribute: #species value: #(mosquito reservoir1 reservoir2)."
	concern addTransitionFrom: { #status->#S } to: { #status->#I } probability: [ :aModel| (aModel atParameter: #beta) * (aModel atCompartment: {#status->#I})].
	concern addTransitionFrom: { #status->#I } to: { #status->#R } probability: [ :aModel| (aModel atParameter: #gamma)].
	self assert: model transitions size equals: 0.
	self assert: (concern generateTensorSum: model transitions) size equals: 2.
	
]

{ #category : #tests }
KEModelPartTest >> testGenerateTensorSum2 [
	|concern model|
	concern := KEModelPart new.
	concern addAttribute: #status value: #(S I R).
	model := KEModel new.
	model addAttribute: #species value: #(mosquito reservoir1 reservoir2).
	concern addTransitionFrom: { #status->#S } to: { #status->#I } probability: [ :aModel| (aModel atParameter: #beta) * (aModel atCompartment: {#status->#I})].
	concern addTransitionFrom: { #status->#I } to: { #status->#R } probability: [ :aModel| (aModel atParameter: #gamma)].
	self assert: model transitions size equals: 9.
	self assert: (concern generateTensorSum: model transitions) size equals: 6
	
]

{ #category : #tests }
KEModelPartTest >> testGenerateTransitionsFromAnd [
	|t keys concern|
	t := KETransition from: { #status->#S } to: { #status->#I } probability: [ :aModel| aModel atCompartment: { #status->#I } ].
	keys := { Dictionary newFrom: { #species->#mosquito }. Dictionary newFrom: { #species->#reservoir1 }. Dictionary newFrom: { #species->#reservoir2 } }.
	concern := KEModelPart new.
	self assert: (concern generateTransitionsFrom: t and: keys) size equals: 3
]

{ #category : #tests }
KEModelPartTest >> testSplitStatus [
	| twoStrains |
	twoStrains := KEModelPart extends: sirConcern.
	twoStrains
		splitStatus:
			{#(I).
			(#strains -> #(1 2))}.
	self assert: (twoStrains atAttribute: #status) size equals: 5.
	self assert: twoStrains transitions size equals: 12
]
