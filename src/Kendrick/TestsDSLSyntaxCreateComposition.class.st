Class {
	#name : #TestsDSLSyntaxCreateComposition,
	#superclass : #TestsIST,
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
TestsDSLSyntaxCreateComposition >> script [
	KModel SIRDemography
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma b mu);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- b --> S.
	);
	lambda: #(beta*I/N).

	KModel AgeStructure
	attribute: #(age -> J A);
	parameters: #(m);
	transitions: #(
		J -- m --> A.
	).

	Composition AgeSIRModel
	model: 'SIRDemography';
	model: 'AgeStructure'.

]

{ #category : #initialization }
TestsDSLSyntaxCreateComposition >> setUp [ 

	KendrickInternalDSLEntities clearAll.
	"KEGillespieSimulatorForTesting newSeed." "stochastic but reproducible each time"

]

{ #category : #'as yet unclassified' }
TestsDSLSyntaxCreateComposition >> tearDown [ 

	KendrickInternalDSLEntities clearAll.

]

{ #category : #tests }
TestsDSLSyntaxCreateComposition >> testCreateModel [ 
	|model1 model2 model|
	self script.
	model1 := KModel withId: 'SIRDemography'.
	model2 := KModel withId: 'AgeStructure'.
	model := Composition withId: 'AgeSIRModel'.

	self assert: (model1 keConcern attributes at: #status) size equals: 3.
	self assert: (model2 keConcern attributes at: #age) size equals: 2. 
	self assert: (model model attributes at: #age) size equals: 2.
	self assert: (model model attributes at: #status) size equals: 3.
	self assert: (model model transitions size) equals: 15.

]
