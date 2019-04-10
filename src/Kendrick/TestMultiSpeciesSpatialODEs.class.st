Class {
	#name : #TestMultiSpeciesSpatialODEs,
	#superclass : #TestCase,
	#instVars : [
		'beforeSimulator',
		'afterSimulator',
		'beforeModel',
		'afterModel'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialODEs >> after [

ModelComponent MultiSpeciesSpatial	
	population: 27500;
	attributes: #(status -> S E I R);
	parameters: #(N mu sigma gamma rho beta p q s i);
	S: #(
			#(500 4990)
			#(500 5000)
			#(500 5000)
			#(500 5000)
			#(500 5000)
	);
	I: #(
		#(0 10)
		#(0 0)
		#(0 0)
		#(0 0)
		#(0 0)
	);
	N: #(
		#(500 5000)
		#(500 5000)
		#(500 5000)
		#(500 5000)
		#(500 5000)
	);
	mu: #(
		#(0.000365 0.00137)
		#(0.000365 0.00137)
		#(0.000365 0.00137)
		#(0.000365 0.00137)
		#(0.000365 0.00137)
	);
	sigma: #(
		#(0.5 0.67)
		#(0.5 0.67)
		#(0.5 0.67)
		#(0.5 0.67)
		#(0.5 0.67)
	);
	gamma: #(
		#(0.25 0.233)
		#(0.25 0.233)
		#(0.25 0.233)
		#(0.25 0.233)
		#(0.25 0.233)
	);
	rho: #(
		#(#(0.0 0.03 0.0 0.0 0.0) #(0.0 0.0 0.03 0.0 0.0) #(0.0 0.0 0.0 0.03 0.0) #(0.0 0.0 0.0 0.0 0.03) #(0.03 0.0 0.0 0.0 0.0))
		#(#(0.0 0.1 0.0 0.0 0.0) #(0.0 0.0 0.1 0.0 0.0) #(0.0 0.0 0.0 0.1 0.0) #(0.0 0.0 0.0 0.0 0.1) #(0.1 0.0 0.0 0.0 0.0))
	);
	beta: #(#(0 0.21) #(0 0.42));
	p: #(1 2 3 4 5);
	q: #(1 2 3 4 5);
	s: #(1 2);
	i: #(1 2);
	equations: #(
		S[p][s]:t=mu[p][s]*N[p][s]-sum(i,beta[i][s]*I[p][i])/N[p][i]*S[p][s]-mu[p][s]*S[p][s]+sum(q,rho[s][p][q]*S[q][s])-sum(q,rho[s][q][p])*S[p][s]+nu*R[p][s].
		E[p][s]:t=sum(i,beta[i][s]*I[p][i])/N[p][i]*S[p][s]-sigma[p][s]*E[p][s]-mu[p][s]*E[p][s]+sum(q,rho[s][p][q]*E[q][s])-sum(q,rho[s][q][p])*E[p][s].
		I[p][s]:t=sigma[p][s]*E[p][s]-gamma[p][s]*I[p][s]-mu[p][s]*I[p][s]+sum(q,rho[s][p][q]*I[q][s])-sum(q,rho[s][q][p])*I[p][s].
		R[p][s]:t=gamma[p][s]*I[p][s]-mu[p][s]*I[p][s]-nu*R[p][s]+sum(q,rho[s][p][q]*R[q][s])-sum(q,rho[s][q][p])*R[p][s].
	).
		
Simulation SpatialRungeKutta rungeKutta
	for: 'MultiSpeciesSpatial';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SpatialDiagramViz diagram 
	forModel: 'SpatialRungeKutta';
	data: #(I_species);"seems to be need some more handling here"
	legendTitle: 'Total of Infectious';
	legends: #( 'humans' 'birds' );
	xLabel: 'Time (days)'.
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialODEs >> before [

|model simulator db f |
model := KEModel new.
model
	atCompartment: #S
	put: #(#(500 4990)#(500 5000)#(500 5000)#(500 5000)#(500 5000))
	atOthersPut: #(#(0 0)#(0 0)#(0 0)#(0 0)#(0 0)).
model
	atCompartment: #I
	put: #(#(0 10)#(0 0)#(0 0)#(0 0)#(0 0)).
model
	atParameter: #N
	assignValue: #(#(500 5000)#(500 5000)#(500 5000)#(500 5000)#(500 5000)).
model
	atParameter: #mu
	assignValue: #(#(0.000365 0.00137)#(0.000365 0.00137)#(0.000365 0.00137)#(0.000365 0.00137)#(0.000365 0.00137)).
model
	atParameter: #sigma
	assignValue: #(#(0.5 0.67)#(0.5 0.67)#(0.5 0.67)#(0.5 0.67)#(0.5 0.67)).

model
	atParameter: #gamma
	assignValue: #(#(0.25 0.233)#(0.25 0.233)#(0.25 0.233)#(0.25 0.233)#(0.25 0.233)).

model
	atParameter: #nu assignValue: 0.00274.

model
	atParameter: #rho
	assignValue: {0.03*#(#(0 1 0 0 0)#(0 0 1 0 0)#(0 0 0 1 0)#(0 0 0 0 1)#(1 0 0 0 0))
		. 0.1*#(#(0 1 0 0 0)#(0 0 1 0 0)#(0 0 0 1 0)#(0 0 0 0 1)#(1 0 0 0 0))}.
model
	atParameter: #beta assignValue: #(#(0 0.21) #(0 0.42)).

model
	atParameter: #p assignValue: (1 to: 5).

model
	atParameter: #q assignValue: (1 to: 5).

model
	atParameter: #s assignValue: (1 to: 2).

model
	atParameter: #i assignValue: (1 to: 2).

model addEquation:
	'S[p][s]:t=mu[p][s]*N[p][s]-sum(i,beta[i][s]*I[p][i])/N[p][i]*S[p][s]-mu[p][s]*S[p][s]+sum(q,rho[s][p][q]*S[q][s])-sum(q,rho[s][q][p])*S[p][s]+nu*R[p][s]' parseAsAnEquation.
model addEquation:
	'E[p][s]:t=sum(i,beta[i][s]*I[p][i])/N[p][i]*S[p][s]-sigma[p][s]*E[p][s]-mu[p][s]*E[p][s]+sum(q,rho[s][p][q]*E[q][s])-sum(q,rho[s][q][p])*E[p][s]' parseAsAnEquation.
model addEquation:
	'I[p][s]:t=sigma[p][s]*E[p][s]-gamma[p][s]*I[p][s]-mu[p][s]*I[p][s]+sum(q,rho[s][p][q]*I[q][s])-sum(q,rho[s][q][p])*I[p][s]' parseAsAnEquation.
model addEquation:
	'R[p][s]:t=gamma[p][s]*I[p][s]-mu[p][s]*I[p][s]-nu*R[p][s]+sum(q,rho[s][p][q]*R[q][s])-sum(q,rho[s][q][p])*R[p][s]' parseAsAnEquation.

"Run the model with RK4"
simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
    simulator executeOn: model.
    db := KEDiagramBuilder new.

    f := [:name| |d tmp|
        tmp := (simulator timeSeriesOutputsAt: name) collect: [ :e| e value ].
        d := OrderedCollection new.
        1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
        (KETimeSeries from: d withIndex: tmp first index) compartment: (STON fromString: name)
        ].
    db data: { 
        (f value: {#status -> #I. #species -> #bird}). 
        (f value: {#status -> #I. #species -> #human}) }.
    db xLabel: 'Time (days)'.
    db legendTitle: 'Total of infectious'.
    db legends: { 'birds'. 'humans' }.

    db open.

	^ simulator -> model
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialODEs >> createModels [

	| beforePair |
	beforePair := self before.
	beforeSimulator := beforePair key.
	beforeModel := beforePair value.
	self after.
	afterSimulator := Simulation withId: 'SpatialRungeKutta'.
	afterModel := ModelComponent withId: 'MultiSpeciesSpatial'.
	(Visualization withId: 'SpatialDiagramViz') open.	
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialODEs >> setUp [

	KendrickInternalDSLEntities clearAll.
	"KEGillespieSimulatorForTesting newSeed." "stochastic but reproducible each time"
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialODEs >> tearDown [

	KendrickInternalDSLEntities clearAll.
]

{ #category : #'as yet unclassified' }
TestMultiSpeciesSpatialODEs >> testEquivalence [
]
