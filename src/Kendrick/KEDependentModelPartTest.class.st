"
A KEDependentConcernTest is a test class for testing the behavior of KEDependentConcern
"
Class {
	#name : #KEDependentModelPartTest,
	#superclass : #TestCase,
	#instVars : [
		'multiHostConcern',
		'spatialConcern',
		'sirConcern'
	],
	#category : #'Kendrick-Tests-Core'
}

{ #category : #initialization }
KEDependentModelPartTest >> setUp [
	self setUpSIRConcern.
	self setUpMultiHostConcern.
	self setUpSpatialConcern
]

{ #category : #initialization }
KEDependentModelPartTest >> setUpMultiHostConcern [
	multiHostConcern := KEModelPart new addAttribute: #species value: #(#human #bird)
]

{ #category : #initialization }
KEDependentModelPartTest >> setUpSIRConcern [
	sirConcern := KEModelPart new.
	sirConcern attributes: 
		{#status->#(#S #I #R)}.
	sirConcern addParameters: {#beta. #gamma. #mu}.
	sirConcern
		addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :aModel | 
			(aModel atParameter: #beta) * 
			(aModel atCompartment: {#status->#I}) ].
	sirConcern addTransitionFrom: '{#status: #I}' 
			to: '{#status: #R}' 
			probability: [ :aModel | aModel atParameter: #gamma ].
	sirConcern addTransitionFrom: #empty 
			to: { #status -> #S } 
			probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: { #status -> #S } 
			to: #empty 
			probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: { #status -> #I } 
			to: #empty 
			probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: { #status -> #R } 
			to: #empty 
			probability: [ :aModel | aModel atParameter: #mu ]
]

{ #category : #initialization }
KEDependentModelPartTest >> setUpSpatialConcern [
	spatialConcern := KEModelPart new.
	spatialConcern addAttribute: #patch value: (1 to: 5) asArray.
	spatialConcern addParameter: #rho.
	1 to: 5 do: [ :i| 
		(i < 5) 
		ifTrue: [  
			spatialConcern 
				addTransitionFrom: { #patch->i } 
				to: { #patch->(i+1) } 
				probability: [ :aModel| aModel atParameter: #rho ].
		]
		ifFalse: [  
			spatialConcern 
				addTransitionFrom: { #patch->i } 
				to: { #patch->1 } 
				probability: [ :aModel| aModel atParameter: #rho ].
		]
	]
]

{ #category : #tests }
KEDependentModelPartTest >> testAddStatus [
	| model concern sirTransitionMatrix |
	model := KEModel new population: KEPopulation new.
	model integrate: sirConcern.
	model integrate: multiHostConcern.
	concern := KEModelPart dependOn: sirConcern.
	concern addStatus: #(E).
	concern removeTransitionFrom: {(#status -> #S)} to: {(#status -> #I)}.
	concern addTransitionFrom: {(#status -> #S)} to: {(#status -> #E)} probability: [ :aModel | aModel atParameter: #lambda ].
	concern addTransitionFrom: {(#status -> #E)} to: {(#status -> #I)} probability: [ :aModel | aModel atParameter: #epsilon ].
	concern addTransitionFrom: {(#status -> #E)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	concern addParameter: #epsilon.
	sirTransitionMatrix := concern project: model transitions.
	self assert: (concern generateSum: sirTransitionMatrix) size equals: 8
]

{ #category : #tests }
KEDependentModelPartTest >> testGenerateSum [
	| model concern sirTransitionMatrix |
	model := KEModel new population: KEPopulation new.
	model integrate: sirConcern.
	model integrate: multiHostConcern.
	concern := KEModelPart dependOn: sirConcern.
	concern atAttribute: #status add: #E.
	concern removeTransitionFrom: {(#status -> #S)} to: {(#status -> #I)}.
	concern addTransitionFrom: {(#status -> #S)} to: {(#status -> #E)} probability: [ :aModel | aModel atParameter: #lambda ].
	concern addTransitionFrom: {(#status -> #E)} to: {(#status -> #I)} probability: [ :aModel | aModel atParameter: #epsilon ].
	concern addTransitionFrom: {(#status -> #E)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	concern addParameter: #epsilon.
	sirTransitionMatrix := concern project: model transitions.
	self assert: (concern generateSum: sirTransitionMatrix) size equals: 8
]

{ #category : #tests }
KEDependentModelPartTest >> testGenerateTensorSum [
	| model concern |
	model := KEModel new population: KEPopulation new.
	model integrate: sirConcern.
	model integrate: spatialConcern.
	concern := KEModelPart dependOn: sirConcern.
	concern atAttribute: #status add: #E.
	concern removeTransitionFrom: {(#status -> #S)} to: {(#status -> #I)}.
	concern addTransitionFrom: {(#status -> #S)} to: {(#status -> #E)} probability: [ :aModel | aModel atParameter: #lambda ].
	concern addTransitionFrom: {(#status -> #E)} to: {(#status -> #I)} probability: [ :aModel | aModel atParameter: #epsilon ].
	concern addTransitionFrom: {(#status -> #E)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	concern addParameter: #epsilon.
	self assert: (concern generateTensorSum: model transitions) size equals: 60
]

{ #category : #tests }
KEDependentModelPartTest >> testProject [
	| model concern |
	model := KEModel new population: KEPopulation new.
	model integrate: sirConcern.
	model integrate: multiHostConcern.
	concern := KEModelPart dependOn: sirConcern.
	self assert: (concern project: model transitions) size equals: 6
]

{ #category : #tests }
KEDependentModelPartTest >> testRemainingMatrixAfterProjecting [
	| model concern |
	model := KEModel new population: KEPopulation new.
	model integrate: sirConcern.
	model integrate: multiHostConcern.
	concern := KEModelPart dependOn: sirConcern.
	self assert: (concern remainingMatrixAfterProjecting: model transitions) size equals: 4
]

{ #category : #tests }
KEDependentModelPartTest >> testRemainingMatrixAfterProjecting2 [
	| model concern |
	model := KEModel new population: KEPopulation new.
	model integrate: sirConcern.
	model integrate: spatialConcern.
	concern := KEModelPart dependOn: sirConcern.
	self assert: (concern remainingMatrixAfterProjecting: model transitions) size equals: 5
]

{ #category : #tests }
KEDependentModelPartTest >> testRemoveTransitionFromTo [
	| model concern sirTransitionMatrix |
	model := KEModel new population: KEPopulation new.
	model integrate: sirConcern.
	model integrate: multiHostConcern.
	concern := KEModelPart dependOn: sirConcern.
	concern atAttribute: #status add: #E.
	concern removeTransitionFrom: {(#status -> #S)} to: {(#status -> #I)}.
	concern addTransitionFrom: {(#status -> #S)} to: {(#status -> #E)} probability: [ :aModel | aModel atParameter: #lambda ].
	concern addTransitionFrom: {(#status -> #E)} to: {(#status -> #I)} probability: [ :aModel | aModel atParameter: #epsilon ].
	concern addTransitionFrom: {(#status -> #E)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	concern addParameter: #epsilon.
	sirTransitionMatrix := concern project: model transitions.
	self assert: (concern generateSum: sirTransitionMatrix) size equals: 8
]

{ #category : #tests }
KEDependentModelPartTest >> testSplitStatus [
	| twoStrains model |
	twoStrains := KEModelPart dependOn: sirConcern.
	twoStrains transitions: sirConcern transitions.
	twoStrains
		splitStatus:
			{#(I).
			(#index -> #(1 2))}.
	self assert: (twoStrains atAttribute: #status) size equals: 5.
	self assert: twoStrains transitions size equals: 12.
	model := KEModel new population: KEPopulation new.
	model integrate: sirConcern.
	model integrate: twoStrains.
	self assert: model transitions size equals: 9
]

{ #category : #tests }
KEDependentModelPartTest >> testSplitStatus2 [
	|twoStrains model|
	twoStrains := KEModelPart dependOn:  sirConcern.
	twoStrains transitions:  sirConcern transitions.
	twoStrains splitStatus: { #(S I). #index->#(1 2) }.

	self assert: (twoStrains atAttribute: #status) size equals: 7.
	self assert: (twoStrains transitions size) equals: 16.
	
	model := KEModel new population: (KEPopulation new).
	model integrate:  sirConcern.
	model integrate: twoStrains.
	
	self assert: (model transitions) size equals: 11.
]

{ #category : #tests }
KEDependentModelPartTest >> testSplitStatus3 [
	|twoStrains model|
	twoStrains := KEModelPart dependOn:  sirConcern.
	twoStrains transitions:  sirConcern transitions.
	twoStrains splitStatus: { #(S I). #index->(1 to: 2) }.

	self assert: (twoStrains atAttribute: #status) size equals: 7.
	self assert: (twoStrains transitions size) equals: 16.
	
	model := KEModel new population: (KEPopulation new).
	model integrate:  sirConcern.
	model integrate: twoStrains.
	
	self assert: (model transitions) size equals: 11.
]

{ #category : #tests }
KEDependentModelPartTest >> testUpdateTransitionFromToProbability [
	| model concern sirTransitionMatrix |
	model := KEModel new population: KEPopulation new.
	model integrate: sirConcern.
	model integrate: multiHostConcern.
	concern := KEModelPart dependOn: sirConcern.
	concern atAttribute: #status add: #Q.
	concern updateTransitionFrom: {(#status -> #S)} to: {(#status -> #I)} probability: [ :aModel | aModel atParameter: #lambda ].
	concern addTransitionFrom: {(#status -> #I)} to: {(#status -> #Q)} probability: [ :aModel | aModel atParameter: #nu ].
	concern addTransitionFrom: {(#status -> #Q)} to: {(#status -> #R)} probability: [ :aModel | aModel atParameter: #epsilon ].
	concern addTransitionFrom: {(#status -> #Q)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	concern addParameters: #(#epsilon #nu #lambda).
	sirTransitionMatrix := concern project: model transitions.
	self assert: (concern generateSum: sirTransitionMatrix) size equals: 9
]
