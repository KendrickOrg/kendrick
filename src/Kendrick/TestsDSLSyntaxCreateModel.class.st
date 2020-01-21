Class {
	#name : #TestsDSLSyntaxCreateModel,
	#superclass : #TestsIST,
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #initialization }
TestsDSLSyntaxCreateModel >> script [ 
	KendrickModel SIRDemography
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma b mu);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- b --> S.
	);
	lambda: #(beta*I/N).

]

{ #category : #initialization }
TestsDSLSyntaxCreateModel >> setUp [ 
	KendrickInternalDSLEntities clearAll.
	"KEGillespieSimulatorForTesting newSeed." "stochastic but reproducible each time"

]

{ #category : #initialization }
TestsDSLSyntaxCreateModel >> tearDown [ 

	KendrickInternalDSLEntities clearAll.

]

{ #category : #initialization }
TestsDSLSyntaxCreateModel >> testCreateModelAttributes [ 
	|model|
	self script.
	model := KendrickModel withId: 'SIRDemography'.

	self assert: (model keConcern attributes at: #status) size equals: 3
]

{ #category : #initialization }
TestsDSLSyntaxCreateModel >> testCreateModelAttributesValue [ 
	|model|
	self script.
	model := KendrickModel withId: 'SIRDemography'.

	self assert: (model keConcern attributes at: #status) equals: #(#S #I #R)
]

{ #category : #initialization }
TestsDSLSyntaxCreateModel >> testCreateModelTransitions [ 
	|model|
	self script.
	model := KendrickModel withId: 'SIRDemography'.

	self assert: (model keConcern) transitions size equals: 6

]
