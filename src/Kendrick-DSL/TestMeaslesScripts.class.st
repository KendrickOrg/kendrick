Class {
	#name : #TestMeaslesScripts,
	#superclass : #TestCase,
	#instVars : [
		'beforeSimulator',
		'afterSimulator',
		'beforeModel',
		'afterModel',
		'beforeDiagram',
		'afterDiagram'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
TestMeaslesScripts >> after [

KModel	 Measles
	attribute: #(status -> S E I R);
	parameters: #(beta gamma mu sigma); 
	equations: #(
	   S:t=mu*N - beta*S*I - mu*S.
      E:t=beta*S*I - sigma*E - mu*E.
      I:t=sigma*E - gamma*I - mu*I.
      R:t=gamma*I - mu*R.
	);
	S: 99999;
	I: 1;
	others: 0;
	beta: 0.0000214;
	gamma: 0.143;
	mu: 0.0000351;
	sigma: 0.125.	
		
Simulation MeaslesRKSim rungeKutta
	forModel: 'Measles';
	from: 0.0; 
	to: 150; 
	step: 1.
	
Visualization MeaslesDiagramViz chart  
	for: 'MeaslesRKSim';
	xLabel: 'Time (days)'.
]

{ #category : #'as yet unclassified' }
TestMeaslesScripts >> afterBench [

ModelComponent	Measles
	attribute: #(status -> S E I R);
	parameters: #(beta gamma mu sigma); 
	equations: #(
	   S:t=mu*N - beta*S*I - mu*S.
      E:t=beta*S*I - sigma*E - mu*E.
      I:t=sigma*E - gamma*I - mu*I.
      R:t=gamma*I - mu*R.
	);
	population: 100000;
	S: 99999;
	I: 1;
	others: 0;
	beta: 0.0000214;
	gamma: 0.143;
	mu: 0.0000351;
	sigma: 0.125.	
		
Simulation MeaslesRKSim rungeKutta
	forModel: 'Measles';
	from: 0.0; 
	to: 150; 
	step: 1;
	init;
	execute.
]

{ #category : #'as yet unclassified' }
TestMeaslesScripts >> before [

| model simulator chart |
model := KEModel new.
model addAttribute: #status value: #(S E I R).
model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
model atCompartment: { #status->#I } put: 1.
model addEquations: { 
            'S:t=mu*N - beta*S*I - mu*S'.
            'E:t=beta*S*I - sigma*E - mu*E'.
            'I:t=sigma*E - gamma*I - mu*I'.
            'R:t=gamma*I - mu*R'
            }.
model addParameters: {
        #beta->0.0000214. 
        #gamma->0.143. 
        #mu->0.0000351. 
        #sigma->0.125 }.
simulator := KESimulator new: #RungeKutta from: 0.0 to: 150 step: 1.
simulator executeOn: model.
chart := KEChart new addDataFrame: (simulator timeSeriesOutputs).

chart plot.

^ {simulator . model . chart}
]

{ #category : #'as yet unclassified' }
TestMeaslesScripts >> beforeBench [

| model simulator |
model := KEModel new.
model addAttribute: #status value: #(S E I R).
model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
model atCompartment: { #status->#I } put: 1.
model addEquations: { 
            'S:t=mu*N - beta*S*I - mu*S'.
            'E:t=beta*S*I - sigma*E - mu*E'.
            'I:t=sigma*E - gamma*I - mu*I'.
            'R:t=gamma*I - mu*R'
            }.
model addParameters: {
        #beta->0.0000214. 
        #gamma->0.143. 
        #mu->0.0000351. 
        #sigma->0.125 }.
simulator := KESimulator new: #RungeKutta from: 0.0 to: 150 step: 1.
simulator executeOn: model.

]

{ #category : #'as yet unclassified' }
TestMeaslesScripts >> bench [

	| before after |
	
	before := self benchmark: [self beforeBench] times: 100.
	after := self benchmark: [self afterBench] times: 100.
	
	Transcript 
		show: before; cr; 
		show: after; cr; 
		show: (after at: 1) / (before at: 1); cr; cr.
]

{ #category : #'as yet unclassified' }
TestMeaslesScripts >> benchmark: aBlock times: anInteger [

	"µ the average time in ms and τ standard deviation"

	| runs average deviation |

	runs := [ 
		(1 to: anInteger) 
			collect: [ :each | Time millisecondsToRun: aBlock ] ] 
		valueUnpreemptively.
	average := runs average asFloat.
	deviation := ((runs 
		detectSum: [ :each | (each - average) * (each - average) ]) 
			/ runs size) sqrt.
	^ Array with: average with: deviation
]

{ #category : #'as yet unclassified' }
TestMeaslesScripts >> createModels [

	| beforeList |
	beforeList := self before.
	beforeSimulator := beforeList first.
	beforeModel := beforeList second.
	beforeDiagram := beforeList third.
	self after.
	afterSimulator := Simulation withId: 'MeaslesRKSim'.
	afterModel := ModelComponent withId: 'Measles'.
	afterDiagram := (Visualization withId: 'MeaslesDiagramViz') open.
]

{ #category : #'as yet unclassified' }
TestMeaslesScripts >> setUp [

	KendrickInternalDSLEntities clearAll.
	"KEGillespieSimulatorForTesting newSeed." "stochastic but reproducible each time"
]

{ #category : #'as yet unclassified' }
TestMeaslesScripts >> tearDown [

	KendrickInternalDSLEntities clearAll.
]

{ #category : #'as yet unclassified' }
TestMeaslesScripts >> testEquivalence [


	| resultsBefore resultsAfter |
	self createModels.

	beforeModel inspect.
	afterModel keModel inspect.

	"correct (check inspector) -- but timeseries are presented in different order fix"

	resultsBefore := (beforeDiagram data collect: [ :ts | ts peakOfEpidemic floor ]) sorted asOrderedCollection.
	resultsAfter := (afterDiagram data collect: [ :ts | ts peakOfEpidemic floor ]) sorted asOrderedCollection.
	Transcript show: resultsBefore; cr; show: resultsAfter; cr; cr.
	self assert: resultsBefore = resultsAfter.
]
