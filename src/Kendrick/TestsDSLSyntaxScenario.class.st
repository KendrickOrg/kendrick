Class {
	#name : #TestsDSLSyntaxScenario,
	#superclass : #TestsIST,
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
TestsDSLSyntaxScenario >> script [ 
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

	KendrickModel AgeStructure
	attribute: #(age -> J A);
	parameters: #(m);
	transitions: #(
		J -- m --> A.
	).

	Composition AgeSIRModel
		model: 'SIRDemography';
		model: 'AgeStructure'.

	Scenario ParameterModel
	 on: 'AgeSIRModel';
    beta: 0.1;
    gamma: 1/30; 
	 mu_age: {0.01. 0.0025};
	 m: 1/50;
	 b_age: #(0.005 0);
	 lambda: #(beta*I/N sum);
	 S_age: #(0 90);
	 I_age: #(1 9).

]

{ #category : #initialization }
TestsDSLSyntaxScenario >> setUp [
	KendrickInternalDSLEntities clearAll.
	"KEGillespieSimulatorForTesting newSeed." "stochastic but reproducible each time"

]

{ #category : #'as yet unclassified' }
TestsDSLSyntaxScenario >> tearDown [ 
	KendrickInternalDSLEntities clearAll.

]

{ #category : #tests }
TestsDSLSyntaxScenario >> testInspectModelCompartment [ 
	|scenario|
	self script.
	scenario := Scenario withId: 'ParameterModel'.

	self assert: (scenario backEndModel population size) equals: 100.
	self assert: (scenario backEndModel population compartments size) equals: 6.

]

{ #category : #tests }
TestsDSLSyntaxScenario >> testInspectModelParameter [ 
	|scenario|
	self script.
	scenario := Scenario withId: 'ParameterModel'.

	self assert: (scenario backEndModel atParameter: #beta) equals: 0.1.

]
