Class {
	#name : #TestsModel1,
	#superclass : #TestsIST,
	#category : 'Kendrick-InternalDSL'
}

{ #category : #'as yet unclassified' }
TestsModel1 >> script [
	
KendrickModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma mu);
	lambda: #(beta*I/N);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- mu --> S.
	).

Composition SIRInfluenza
	model: 'SIR'.
	
Scenario SIRInfluenza1
	on: 'SIRInfluenza';
	populationSize: 5000;
	S: 4990;
	I: 10;
	others: 0;
	mu: 0.00137;
	gamma: 0.233;
	beta: 0.42.
	
Simulation SIRInfluenzaRK rungeKutta
	scenario: 'SIRInfluenza1';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SIRInfluenzaViz diagram 
	for: 'SIRInfluenzaRK';
	xLabel: 'Time (days)'.
]

{ #category : #'as yet unclassified' }
TestsModel1 >> vizId [

	^ 'SIRInfluenzaViz'
]
