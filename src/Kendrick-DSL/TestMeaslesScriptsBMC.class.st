Class {
	#name : #TestMeaslesScriptsBMC,
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
TestMeaslesScriptsBMC >> after [

KModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma mu);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- mu --> S.
	).	
    
KModel SEIR
	extends: 'SIR';
	parameters: #(sigma);
	delay: #(sigma , S -- lambda --> I  , E).
    
Composition Measles
    model: 'SEIR';
    lambda: #(beta*I).
    
Scenario MeaslesParameters
	 on: 'Measles';
    beta: 0.0000214; 
    gamma: 0.143; 
    mu: 0.0000351; 
    sigma: 0.125.
    
Scenario MeaslesPopulation
    on: 'Measles';
    S: 99999;
    I: 1;
    others: 0.
    
Simulation MeaslesRKSim rungeKutta
	scenarios: #(MeaslesParameters MeaslesPopulation);
	from: 0.0; 
	to: 150; 
	step: 1.
	
Visualization MeaslesDiagramViz chart  
	for: 'MeaslesRKSim';
	xLabel: 'Time (days)'.
]

{ #category : #'as yet unclassified' }
TestMeaslesScriptsBMC >> afterBench [

	ModelComponent Measles
		attribute: #( status -> S E I R );
		parameters: #( beta gamma mu sigma );
		equations:
			#( S: t = mu * N - beta * S * I - mu * S #'.' E: t = beta * S * I -
			   sigma * E - mu * E #'.' I: t = sigma * E - gamma * I - mu * I #'.'
			   R: t = gamma * I - mu * R #'.' );
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
		execute
]

{ #category : #'as yet unclassified' }
TestMeaslesScriptsBMC >> before [

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
TestMeaslesScriptsBMC >> beforeBench [

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
TestMeaslesScriptsBMC >> bench [

	| before after |
	
	before := self benchmark: [self beforeBench] times: 100.
	after := self benchmark: [self afterBench] times: 100.
	
	Transcript 
		show: before; cr; 
		show: after; cr; 
		show: (after at: 1) / (before at: 1); cr; cr.
]

{ #category : #'as yet unclassified' }
TestMeaslesScriptsBMC >> benchmark: aBlock times: anInteger [

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
TestMeaslesScriptsBMC >> createModels [

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
TestMeaslesScriptsBMC >> setUp [

	KendrickInternalDSLEntities clearAll.
	"KEGillespieSimulatorForTesting newSeed." "stochastic but reproducible each time"
]

{ #category : #'as yet unclassified' }
TestMeaslesScriptsBMC >> tearDown [

	KendrickInternalDSLEntities clearAll.
]

{ #category : #accessing }
TestMeaslesScriptsBMC >> testEquivalence [

	| resultsBefore resultsAfter |
	self createModels.

	resultsBefore := ((beforeDiagram data collect: [ :ts | ts max floor ]) 
		                  collect: [ :each | each values ]) sorted.
	resultsAfter := ((afterDiagram data collect: [ :ts | ts max floor ]) 
		                 collect: [ :each | each values ]) sorted.
	self assert: resultsBefore equals: resultsAfter
]
