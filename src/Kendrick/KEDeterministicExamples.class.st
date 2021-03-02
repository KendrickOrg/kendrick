Class {
	#name : #KEDeterministicExamples,
	#superclass : #KEExamples,
	#category : #'Kendrick-Examples'
}

{ #category : #examples }
KEDeterministicExamples >> SEIRConcern [

	| SEIRConcern |
	SEIRConcern := KEModelPart new.
	SEIRConcern attributes: {(#status -> #(#S #E #I #R))}.
	SEIRConcern addParameters: {#beta . #gamma . #mu . #sigma}.
	SEIRConcern
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #E)}
		probability: [ :aModel | (aModel atParameter: #beta) * (aModel atCompartment: {(#status -> #I)}) ].
	SEIRConcern addTransitionFrom: {(#status -> #E)} to: {(#status -> #I)} probability: [ :aModel | aModel atParameter: #sigma ].
	SEIRConcern addTransitionFrom: {(#status -> #I)} to: {(#status -> #R)} probability: [ :aModel | aModel atParameter: #gamma ].
	SEIRConcern addTransitionFrom: {(#status -> #S)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	SEIRConcern addTransitionFrom: {(#status -> #I)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	SEIRConcern addTransitionFrom: {(#status -> #R)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	SEIRConcern addTransitionFrom: {(#status -> #E)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	SEIRConcern addTransitionFrom: #empty to: {(#status -> #S)} probability: [ :aModel | aModel atParameter: #mu ].
	^ SEIRConcern
]

{ #category : #examples }
KEDeterministicExamples >> SEIRSConcern [

	| SEIRSConcern |
	SEIRSConcern := KEModelPart new.
	SEIRSConcern attributes: {(#status -> #(#S #E #I #R))}.
	SEIRSConcern addParameters: {#beta . #gamma . #mu . #sigma . #v}.
	SEIRSConcern
		addParameter: #lambda
		value: [ :aModel | (aModel atParameter: #beta) * (aModel atCompartment: {(#status -> #I)}) / (aModel atParameter: #N) ].
	SEIRSConcern addTransitionFrom: {(#status -> #S)} to: {(#status -> #E)} probability: [ :aModel | aModel atParameter: #lambda ].
	SEIRSConcern addTransitionFrom: {(#status -> #E)} to: {(#status -> #I)} probability: [ :aModel | aModel atParameter: #sigma ].
	SEIRSConcern addTransitionFrom: {(#status -> #I)} to: {(#status -> #R)} probability: [ :aModel | aModel atParameter: #gamma ].
	SEIRSConcern addTransitionFrom: {(#status -> #R)} to: {(#status -> #S)} probability: [ :aModel | aModel atParameter: #v ].
	SEIRSConcern addTransitionFrom: {(#status -> #S)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern addTransitionFrom: {(#status -> #I)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern addTransitionFrom: {(#status -> #R)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern addTransitionFrom: {(#status -> #E)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern addTransitionFrom: #empty to: {(#status -> #S)} probability: [ :aModel | aModel atParameter: #mu ].
	^ SEIRSConcern
]

{ #category : #examples }
KEDeterministicExamples >> SIRConcern [

	| SIRConcern |
	SIRConcern := KEModelPart new.
	SIRConcern attributes: 
		{#status->#(#S #I #R)}.
	SIRConcern addParameters: {#beta. #gamma}.
	SIRConcern
		addTransitionFrom: {#status -> #S}
		to: {#status -> #I}
		probability: [ :aModel | 
			(aModel atParameter: #beta) * 
			(aModel atCompartment: {#status->#I}) ].
	SIRConcern addTransitionFrom: {#status -> #I}
			to: {#status -> #R} 
			probability: [ :aModel | aModel atParameter: #gamma ].
	^ SIRConcern
]

{ #category : #examples }
KEDeterministicExamples >> SIRDemographyConcern [

	| SIRDemographyConcern |
	SIRDemographyConcern := KEModelPart new.
	SIRDemographyConcern attributes: 
		{#status->#(#S #I #R)}.
	SIRDemographyConcern addParameters: {#beta. #gamma. #mu}.
	SIRDemographyConcern addEquation: 'S:t=mu*N-beta*S*I-mu*S'.
	SIRDemographyConcern addEquation: 'I:t=beta*S*I-gamma*I-mu*I'.
	SIRDemographyConcern addEquation: 'R:t=gamma*I-mu*R'.
	
	^ SIRDemographyConcern 
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOn2SEIRMeaslesModelWithVaccination [
	"self new exampleRK4SolverOn2SEIRMeaslesModelWithVaccination"

	| model simulator chart|
	
	model := KEModel new.
	model attributes: {(#status -> #(S E I R))}.
	model atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	model
		addParameters:
			{(#beta -> 0.00782).
			(#gamma -> 52.14).
			(#mu -> 0.0128).
			(#sigma -> 45.625).
			(#p -> 0.7)}.
	model
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #E)}
		probability: [ :m | (m atParameter: #beta) * (m atCompartment: {(#status -> #I)}) ].
	model
		addTransitionFrom: {(#status -> #E)}
		to: {(#status -> #I)}
		probability: [ :m | m atParameter: #sigma ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: {(#status -> #R)}
		probability: [ :m | m atParameter: #gamma ].
	model
		addTransitionFrom: {(#status -> #S)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #R)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #E)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: #empty
		to: {(#status -> #S)}
		probability: [ :m | (m atParameter: #mu) * (1 - (m atParameter: #p)) ].
	model
		addTransitionFrom: #empty
		to: {(#status -> #R)}
		probability: [ :m | (m atParameter: #mu) * (m atParameter: #p) ].

	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 100
		step: 0.01.
	simulator executeOn: model.
	
	chart := KEChart new addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	chart xLabel: 'Time (years)'.
	chart legendTitle: 'Vaccination Rate'.
	chart plotLog
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnMigrationModelWithDependentConcern [
	"self new exampleRK4SolverOnMigrationModelWithDependentConcern"

	| model sirConcern eConcern spatialConcern simulator db |
	sirConcern := KEModelPart new.
	sirConcern attributes: {(#status -> #(#S #I #R))}.
	sirConcern addParameters: {#lambda . #gamma}.
	sirConcern addTransitionFrom: {(#status -> #S)} to: {(#status -> #I)} probability: [ :aModel | aModel atParameter: #lambda ].
	sirConcern addTransitionFrom: {(#status -> #I)} to: {(#status -> #R)} probability: [ :aModel | aModel atParameter: #gamma ].
	spatialConcern := KEModelPart new.
	spatialConcern addAttribute: #patch value: (1 to: 5) asArray.
	spatialConcern addParameter: #rho.
	1 to: 4
		do: [ :i | 
spatialConcern
						addTransitionFrom: {(#patch -> i)}
						to: {(#patch -> (i + 1))}
						probability: [ :aModel | aModel atParameter: #rho ]].
	spatialConcern addTransitionFrom: {(#patch -> 5)} to: {(#patch -> 1)} probability: [ :aModel | aModel atParameter: #rho ].
	model := KEModel new.
	model integrate: spatialConcern.
	model integrate: sirConcern.
	eConcern := KEModelPart dependOn: sirConcern.
	eConcern atAttribute: #status add: #E.
	eConcern removeTransitionFrom: {(#status -> #S)} to: {(#status -> #I)}.
	eConcern addTransitionFrom: {(#status -> #S)} to: {(#status -> #E)} probability: [ :aModel | aModel atParameter: #lambda ].
	eConcern addTransitionFrom: {(#status -> #E)} to: {(#status -> #I)} probability: [ :aModel | aModel atParameter: #sigma ].
	eConcern addTransitionFrom: {(#status -> #E)} to: #empty probability: [ :aModel | aModel atParameter: #mu ].
	eConcern addParameter: #sigma.
	model integrate: eConcern.
	model
		atParameter: #beta
		assignValue: [ :aModel | 
			| c val |
			c := aModel currentCompartment at: #patch.
			c = 1
				ifTrue: [ val := 0.75 ]
				ifFalse: [ val := 0.5 ].
			val ].
	model atParameter: #mu assignValue: 0.0000365.
	model atParameter: #sigma assignValue: 0.5.
	model atParameter: #gamma assignValue: 0.25.
	model
		atParameter: #N
		assignValue: [ :aModel | 
			| c |
			c := aModel currentCompartment at: #patch.
			aModel sizeOfPopulation: (Array with: c) ].
	model atParameter: #rho assignValue: 0.03.
	model
		atParameter: #lambda
		assignValue: [ :aModel | 
			| c |
			c := aModel currentCompartment at: #patch.
			(aModel atParameter: #beta)
				*
					(aModel
						atCompartment:
							{(#status -> #I).
							(#patch -> c)}) / (aModel atParameter: #N) ].
	model
		atCompartment:
			{(#status -> #S).
			(#patch -> 1)}
		put: 900
		atOthersPut: 0.
	model
		atCompartment:
			{(#status -> #I).
			(#patch -> 1)}
		put: 100.
	model
		atCompartment:
			{(#status -> #S).
			(#patch -> 2)}
		put: 1000.
	model
		atCompartment:
			{(#status -> #S).
			(#patch -> 3)}
		put: 1000.
	model
		atCompartment:
			{(#status -> #S).
			(#patch -> 4)}
		put: 1000.
	model
		atCompartment:
			{(#status -> #S).
			(#patch -> 5)}
		put: 1000.
	simulator := KESimulator
		new: #RungeKutta
		from: 0
		to: 500
		step: 1.
	simulator executeOn: model.
	db := KEDiagramBuilder new.
	db
		addData:
			(simulator
				timeSeriesOutputsAt:
					{(#status -> #I).
					(#patch -> 1)});
		addData:
			(simulator
				timeSeriesOutputsAt:
					{(#status -> #I).
					(#patch -> 2)});
		addData:
			(simulator
				timeSeriesOutputsAt:
					{(#status -> #I).
					(#patch -> 3)});
		addData:
			(simulator
				timeSeriesOutputsAt:
					{(#status -> #I).
					(#patch -> 4)});
		addData:
			(simulator
				timeSeriesOutputsAt:
					{(#status -> #I).
					(#patch -> 5)}).
	db legends: {'patch 1' . 'patch 2' . 'patch 3' . 'patch 4' . 'patch 5'}.
	db legendTitle: 'Infectious'.
	db xLabel: 'Time (days)'.
	db open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnMigrationOneSpeciesModel [
	"self new exampleRK4SolverOnMigrationOneSpeciesModel"

	| model simulator db |
	model := self modelRK4SolverOnMigrationOneSpeciesModel.
	simulator := KESimulator
		new: #RungeKutta
		from: 0
		to: 500
		step: 1.
	simulator executeOn: model.
	db := KEDiagramBuilder new.
	db
		data:
			[ | tmp |
			tmp := OrderedCollection new.
			tmp
				add:
					(simulator
						timeSeriesOutputsAt:
							{#status -> #I.
							#patch -> 1}).
			tmp
				add:
					(simulator
						timeSeriesOutputsAt:
							{(#status -> #I).
							(#patch -> 2)}).
			tmp
				add:
					(simulator
						timeSeriesOutputsAt:
							{(#status -> #I).
							(#patch -> 3)}).
			tmp
				add:
					(simulator
						timeSeriesOutputsAt:
							{(#status -> #I).
							(#patch -> 4)}).
			tmp
				add:
					(simulator
						timeSeriesOutputsAt:
							{(#status -> #I).
							(#patch -> 5)}).
			tmp ] value.
	db legends: {'patch 1' . 'patch 2' . 'patch 3' . 'patch 4' . 'patch 5'}.
	db legendTitle: 'Infectious'.
	db xLabel: 'Time (days)'.
	^ db open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnMigrationTwoSpeciesModel [
	"self new exampleRK4SolverOnMigrationTwoSpeciesModel"

	| model simulator chart |
	model := self modelRK4SolverOnMigrationTwoSpeciesModel.
	simulator := KESimulator
		new: #RungeKutta
		from: 0
		to: 500
		step: 1.
	simulator executeOn: model.
	chart := KEChart new
		addDataFrame:
			(simulator
				timeSeriesOutputsAt:
					{(#status -> #I).
					(#species -> #bird)}).
	chart xLabel: 'Time (days)'.
	chart plot
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnMultiInfectiousStatusModel [
	"self new exampleRK4SolverOnMultiInfectiousStatusModel"

	| model simulator chart |
	model := self modelRK4SolverOnMultiInfectiousStatusModel.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 50
		step: 0.1.
	simulator executeOn: model.
	chart := KEChart new
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)});
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #Is)}).
	chart plot
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnMultiStrainModel [
	"self new exampleRK4SolverOnMultiStrainModel"

	| model simulator chart |
	model := self modelRK4SolverOnMultiStrainModel.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 70
		step: 0.1.
	simulator executeOn: model.
	chart  := KEChart new addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I1)});
	addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I2)}).
	chart plot
]

{ #category : #'as yet unclassified' }
KEDeterministicExamples >> exampleRK4SolverOnMultiStrainModelWithPlotVisualization [
	| model simulator db data |

	model := KEModel new.
	model attributes: {#status->#(#S #I1 #I2 #R)}.
	model atCompartment: { #status->#S } put: 9900.
	model atCompartment: { #status->#I1 } put: 99.
	model atCompartment: { #status->#I2 } put: 1.
	model atCompartment: { #status->#R } put: 0.
	
	model addParameter: #beta1 value: 0.00002.
	model addParameter: #beta2 value: 0.00018.
	model addParameter: #gamma1 value: 0.1.
	model addParameter: #gamma2 value: 1.
	model addParameter: #mu value: 5e-5.
	
	model 
		addTransitionFrom: {#status -> #S}
		to: {#status -> #I1} 
		probability: [ :m| 
			(m atParameter: #beta1) * (m atCompartment: {#status->#I1}) ].
	model
		addTransitionFrom: {#status -> #S} 
		to: {#status -> #I2} 
		probability: [ :m| (m atParameter: #beta2) * (m atCompartment: {#status->#I2}) ].
	model
		addTransitionFrom: {#status -> #I1} 
		to: {#status -> #R} 
		probability: [ :m| (m atParameter: #gamma1) ].
	model
		addTransitionFrom: {#status -> #I2}
		to: {#status -> #R}
		probability: [ :m| (m atParameter: #gamma2) ].
	model
		addTransitionFrom: {#status -> #S}
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model 
		addTransitionFrom: {#status -> #I1}
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model 
		addTransitionFrom: {#status -> #I2} 
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model
		addTransitionFrom: {#status -> #R} 
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model
		addTransitionFrom: #empty 
		to: {#status -> #S} 
		probability: [ :m| (m atParameter: #mu) ].
	
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 70
		step: 0.1.
	simulator executeOn: model.
	data := OrderedCollection new.
	data add: (simulator timeSeriesOutputsAt: {(#status -> #S)}).
	data add: (simulator timeSeriesOutputsAt: {(#status -> #I1)}).
	data add: (simulator timeSeriesOutputsAt: {(#status -> #I2)}).
	data add: (simulator timeSeriesOutputsAt: {(#status -> #R)}).
	
	db := KEDiagramBuilder new data: data.
	db xLabel: 'Time (days)'.
	db yLabel: 'Infectious'.
	db plot 
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnMultipleRiskGroupsModel [
	"self new exampleRK4SolverOnMultipleRiskGroupsModel"

	| model simulator chart |
	model := self modelRK4SolverOnMultipleRiskGroupsModel.
	simulator := KESimulator
		new: #RungeKutta
		from: 0
		to: 30
		step: 0.01.
	simulator executeOn: model.
	chart := KEChart new
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #S)});
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	chart yLabel: 'Infectious'.
	chart plot
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSEIRMeaslesModel [
	"self new exampleRK4SolverOnSEIRMeaslesModel"

	| model simulator diag |
	model := self modelRK4SolverOnSEIRMeasles.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 365
		step: 1.
	simulator executeOn: model.
	diag := KEDiagramBuilder new addData: simulator timeSeriesOutputs.
	diag xLabel: 'Time (days)'.
	^ diag open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSEIRMeaslesModelWithVaccination [
	"self new exampleRK4SolverOnSEIRMeaslesModelWithVaccination"

	| model simulator diag |
	model := self modelRK4SolverOnSEIRMeaslesModelWithVaccination.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 100
		step: 0.01.
	simulator executeOn: model.
	diag := KEDiagramBuilder new addData: (simulator timeSeriesOutputsAt: {(#status -> #I)}) log.
	diag yLabel: 'log(Infectious)'.
	diag xLabel: 'Time (years)'.
	^ diag open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSEIRSModelWithQuarantine [
	"self new exampleRK4SolverOnSEIRSModelWithQuarantine"

	| model SEIRConcern SEIRSConcern QuarantineConcern simulator dB |
	model := KEModel new.
	SEIRConcern := KEModelPart new.
	SEIRConcern attributes: {(#status -> #(#S #E #I #R))}.
	SEIRConcern addParameters: {#beta . #gamma . #mu . #sigma}.
	SEIRConcern addParameter: #lambda value: 'beta*I/N'.
	SEIRConcern
		addEquations:
			{'S:t=mu*N - lambda*S - mu*S' . 'E:t=lambda*S - sigma*E - mu*E' . 'I:t=sigma*E - gamma*I - mu*I' . 'R:t=gamma*I - mu*R'}.
	SEIRSConcern := KEModelPart dependOn: SEIRConcern.
	SEIRSConcern addTransitionFrom: {(#status -> #R)} to: {(#status -> #S)} probability: 'nu'.
	SEIRSConcern addParameter: #nu.
	QuarantineConcern := KEModelPart dependOn: SEIRConcern.
	QuarantineConcern addStatus: #(Q).
	QuarantineConcern addTransitionFrom: {(#status -> #I)} to: {(#status -> #Q)} probability: 'delta'.
	QuarantineConcern addTransitionFrom: {(#status -> #Q)} to: {(#status -> #R)} probability: 'epsilon'.
	QuarantineConcern addTransitionFrom: {(#status -> #Q)} to: #empty probability: 'mu'.
	QuarantineConcern addParameters: {#delta . #epsilon}.
	QuarantineConcern addParameter: #lambda value: 'beta*I/(N-Q)'.
	model integrate: SEIRConcern.
	model integrate: SEIRSConcern.
	model integrate: QuarantineConcern.
	model atParameter: #beta assignValue: 2.14.
	model atParameter: #gamma assignValue: 0.143.
	model atParameter: #sigma assignValue: 0.125.
	model atParameter: #mu assignValue: 0.0000351.
	model atParameter: #nu assignValue: 0.00274.
	model atParameter: #delta assignValue: 0.068.
	model atParameter: #epsilon assignValue: 0.027.
	model atCompartment: {(#status -> #S)} put: 4999.
	model atCompartment: {(#status -> #I)} put: 1.
	model atCompartment: {(#status -> #R)} put: 0.
	model atCompartment: {(#status -> #E)} put: 0.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 365
		step: 1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB addData: simulator timeSeriesOutputs.
	dB xLabel: 'Time (year)'.
	dB open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSEIRSModelWithTwoStrains [
	"self new exampleRK4SolverOnSEIRSModelWithTwoStrains"

	| model SEIRConcern SEIRSConcern twoStrains simulator dB data |
	model := KEModel new.
	SEIRConcern := KEModelPart new.
	SEIRConcern attributes: {(#status -> #(#S #E #I #R))}.
	SEIRConcern addParameters: {#beta . #gamma . #mu . #sigma}.
	SEIRConcern addParameter: #lambda value: 'beta*I/N'.
	SEIRConcern
		addEquations:
			{'S:t=mu*N - lambda*S - mu*S' . 'E:t=lambda*S - sigma*E - mu*E' . 'I:t=sigma*E - gamma*I - mu*I' . 'R:t=gamma*I - mu*R'}.
	SEIRSConcern := KEModelPart extends: SEIRConcern.
	SEIRSConcern addTransitionFrom: {(#status -> #R)} to: {(#status -> #S)} probability: 'nu'.
	SEIRSConcern addParameter: #nu.
	twoStrains := KEModelPart extends: SEIRSConcern.
	twoStrains
		splitStatus:
			{#(I).
			(#strains -> #(1 2))}.
	twoStrains addParameters: {#beta1 . #beta2}.
	model integrate: twoStrains.
	model atParameter: #beta1 assignValue: 0.42.
	model atParameter: #beta2 assignValue: 0.0042.
	model
		atParameter: #gamma
		assignValue: [ :aModel | 
			| c val |
			c := aModel currentCompartment at: #status.
			c = #I1
				ifTrue: [ val := 0.233 ].
			c = #I2
				ifTrue: [ val := 0.00233 ].
			val ].
	model
		atParameter: #sigma
		assignValue: [ :aModel | 
			| c val |
			c := aModel nextCompartment at: #status.
			c = #I1
				ifTrue: [ val := 0.67 ].
			c = #I2
				ifTrue: [ val := 0.0067 ].
			val ].
	model atParameter: #mu assignValue: 0.00137.
	model atParameter: #nu assignValue: 0.00274.
	model atParameter: #lambda assignValue: '((beta1*I1)+(beta2*I2))/N'.
	model atCompartment: {(#status -> #S)} put: 4990.
	model atCompartment: {(#status -> #I)} put: 0.
	model atCompartment: {(#status -> #I1)} put: 10.
	model atCompartment: {(#status -> #I2)} put: 0.
	model atCompartment: {(#status -> #R)} put: 0.
	model atCompartment: {(#status -> #E)} put: 0.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 365
		step: 1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	data := OrderedCollection new.
	data add: (simulator timeSeriesOutputsAt: {(#status -> #I1)}).
	data add: (simulator timeSeriesOutputsAt: {(#status -> #I2)}).
	dB data: data.
	dB xLabel: 'Time (year)'.
	dB open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSIRDemographyModel [
	"self new exampleRK4SolverOnSIRDemographyModel"

	| model simulator dB |
	model := self modelRK4SolverOnSIRDemography.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 146
		step: 0.1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB addData: (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	dB open
]

{ #category : #'as yet unclassified' }
KEDeterministicExamples >> exampleRK4SolverOnSIRDemographyModelWithRoassal3 [
	"self new exampleRK4SolverOnSIRDemographyModelWithRoassal3"

	| model simulator chart |
	model := KEModel new.
	model addAttribute: #status value: #(#S #I #R).
	model atCompartment: {(#status -> #S)} put: 0.7 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 0.2.
	model atCompartment: {(#status -> #R)} put: 0.1.
	model
		addParameters:
			{(#beta -> 1.4246).
			(#gamma -> 0.14286).
			(#mu -> 0.00003913894)}.
	model addEquation: 'S:t= mu -beta*S*I - mu*S'.
	model addEquation: 'I:t= beta*S*I - gamma*I - mu*I'.
	model addEquation: 'R:t= gamma*I - mu*R'.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 200
		step: 1.
	simulator executeOn: model.
	chart := KEChart new
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #S)});
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)});
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #R)}).
	chart plot
]

{ #category : #'as yet unclassified' }
KEDeterministicExamples >> exampleRK4SolverOnSIRModelWithLogVisualisationInRoassal3 [
	"self new exampleRK4SolverOnSIRModelWithLogVisualisationInRoassal3"

	| model simulator chart |
	model := KEModel new.
	model attributes: {(#status -> #(#S #I #R))}.
	model atCompartment: {(#status -> #S)} put: 4975 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 25.
	model
		addParameters:
			{(#beta -> 0.073).
			(#gamma -> 36.5).
			(#mu -> 0.01825)}.
	model
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #I)}
		probability: [ :aModel | 
			(aModel atParameter: #beta)
				* (aModel atCompartment: {(#status -> #I)}) ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: {(#status -> #R)}
		probability: [ :aModel | aModel atParameter: #gamma ].
	model
		addTransitionFrom: {(#status -> #S)}
		to: #empty
		probability: [ :aModel | aModel atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: #empty
		probability: [ :aModel | aModel atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #R)}
		to: #empty
		probability: [ :aModel | aModel atParameter: #mu ].
	model
		addTransitionFrom: #empty
		to: {(#status -> #S)}
		probability: [ :aModel | aModel atParameter: #mu ].
	simulator := KESimulator
		new: #RungeKutta
		from: 0
		to: 0.4
		step: 0.0027.
	simulator executeOn: model.
	chart := KEChart new
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #S)});
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)});
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #R)}).
	chart plotLog
]

{ #category : #'as yet unclassified' }
KEDeterministicExamples >> exampleRK4SolverOnSIRModelWithRoassal3 [
	"self new exampleRK4SolverOnSIRModelWithRoassal3"

	| model simulator chart |
	model := KEModel new.
	model addAttribute: #status value: #(#S #I #R).
	model atCompartment: {(#status -> #S)} put: 0.7 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 0.3.
	model
		addParameters:
			{(#beta -> 1.4247).
			(#gamma -> 0.14286)}.
	model addEquation: 'S:t=-beta*S*I'.
	model addEquation: 'I:t=beta*S*I - gamma*I'.
	model addEquation: 'R:t=gamma*I'.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 70
		step: 0.1.
	simulator executeOn: model.
	chart := KEChart new
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #S)});
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)});
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #R)}).
	chart plot
]

{ #category : #'as yet unclassified' }
KEDeterministicExamples >> exampleRK4SolverOnSIRModelWithSqrtVisualisationInRoassal3 [
	"self new exampleRK4SolverOnSIRModelWithSqrtVisualisationInRoassal3"

	| model simulator chart |
	model := KEModel new.
	model attributes: {(#status -> #(#S #I #R))}.
	model atCompartment: {(#status -> #S)} put: 4975 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 25.
	model
		addParameters:
			{(#beta -> 0.073).
			(#gamma -> 36.5).
			(#mu -> 0.01825)}.
	model
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #I)}
		probability: [ :aModel | 
			(aModel atParameter: #beta)
				* (aModel atCompartment: {(#status -> #I)}) ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: {(#status -> #R)}
		probability: [ :aModel | aModel atParameter: #gamma ].
	model
		addTransitionFrom: {(#status -> #S)}
		to: #empty
		probability: [ :aModel | aModel atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: #empty
		probability: [ :aModel | aModel atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #R)}
		to: #empty
		probability: [ :aModel | aModel atParameter: #mu ].
	model
		addTransitionFrom: #empty
		to: {(#status -> #S)}
		probability: [ :aModel | aModel atParameter: #mu ].
	simulator := KESimulator
		new: #RungeKutta
		from: 0
		to: 0.4
		step: 0.0027.
	simulator executeOn: model.
	
	chart := KEChart new addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #S)});
	addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)});
	addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #R)}).
	chart plotSqrt
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSIRMultiHostModel [
	"self new exampleRK4SolverOnSIRMultiHostModel"

	| model simulator db |
	model := self modelRK4SolverOnSIRMultiHost.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 0.5
		step: 0.0027.
	simulator executeOn: model.
	db := KEDiagramBuilder new addData: (simulator timeSeriesOutputsAt: {(#status -> #I)}) sqrt.
	db open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSIRMultiHostModelTransitionByRate [
	"self new exampleRK4SolverOnSIRMultiHostModelTransitionByRate"

	| model simulator db |
	model := self modelRK4SolverOnSIRMultiHostModelTransitionByRate.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 40.0
		step: 0.01.
	simulator executeOn: model.
	db := KEDiagramBuilder new addData: (simulator timeSeriesOutputsAt: {(#status -> #I)}) sqrt.
	db open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSIRMultiHostModelWithODERepresentation [
	"self new exampleRK4SolverOnSIRMultiHostModelWithODERepresentation"

	| model simulator db |
	model := self modelRK4SolverOnSIRMultiHostModelWithODERepresentation.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 0.5
		step: 0.0027.
	simulator executeOn: model.
	db := KEDiagramBuilder new addData: (simulator timeSeriesOutputsAt: {(#status -> #I)}) sqrt.
	db open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSIRSimpleModel [
	"self new exampleRK4SolverOnSIRSimpleModel"

	| model simulator chart |
	model := self modelRK4SolverOnSIRSimpleModel.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 0.20
		step: 0.001.
	simulator executeOn: model.
	chart := KEChart new addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #S)}); addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)}); addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #R)}).
	chart xLabel: 'Time (year)'.
	chart plot
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSIRSimpleModelWithODERepresentation [
	"self new exampleRK4SolverOnSIRSimpleModelWithODERepresentation"

	| model simulator dB |
	model := self modelRK4SolverOnSIRSimpleModelWithODERepresentation.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 0.3
		step: 0.0027.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB addData: simulator timeSeriesOutputs.
	dB xLabel: 'Time (year)'.
	dB open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSIRSimpleModelWithTransitionProbabilityAsExpression [
	"self new exampleRK4SolverOnSIRSimpleModelWithTransitionProbabilityAsExpression"

	| model simulator dB |
	model := self modelRK4SolverOnSIRSimpleModelWithTransitionProbabilityAsExpression.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 1.0
		step: 0.0027.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB addData: (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	dB open
]

{ #category : #examples }
KEDeterministicExamples >> exampleRK4SolverOnSeasonalForcingModel [
	"self new exampleRK4SolverOnSeasonalForcingModel"

	| model simulator chart |
	model := self modelRK4SolverOnSeasonalForcingModel.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 400
		step: 0.01.
	simulator executeOn: model.
	chart := KEChart
		new
		addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)}) log.
	chart plot
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnMigrationOneSpeciesModel [
	"self new exampleRK4SolverOnMigrationOneSpeciesModel"
	|model spatialConcern  SEIRSConcern|
	SEIRSConcern := self SEIRSConcern.
	spatialConcern := self spatialConcern.
	
	model := KEModel new.
	model integrate: spatialConcern.
	model integrate: SEIRSConcern.
	
	model atParameter: #beta assignValue: [ :aModel| |c| 
		c := aModel currentCompartment at: #patch.
		c = 1 ifTrue: [ 0.42 ] ifFalse: [ 0.28 ]
	].
	model atParameter: #v assignValue: 0.00274.
	model atParameter: #mu assignValue: 0.00137.
	model atParameter: #sigma assignValue: 0.67.
	model atParameter: #gamma assignValue: 0.233.
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := aModel currentCompartment at: #patch.
		aModel sizeOfPopulation: (Array with: c).
		].
	model atParameter: #rho assignValue: 0.1. 
	model atParameter: #lambda assignValue: [ :aModel| |c|
		c := aModel currentCompartment at: #patch.
		(aModel atParameter: #beta) * (aModel atCompartment: {#status->#I. #patch->c}) / (aModel atParameter: #N)
	].
	model atCompartment: { #status->#S. #patch->1 } put: 4990 atOthersPut: 0.
	model atCompartment: { #status->#I. #patch->1 } put: 10.
	model atCompartment: { #status->#S. #patch->2 } put: 5000.
	model atCompartment: { #status->#S. #patch->3 } put: 5000.
	model atCompartment: { #status->#S. #patch->4 } put: 5000.
	model atCompartment: { #status->#S. #patch->5 } put: 5000.
	
	^ model
	
	 
	
	 
	
	
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnMigrationTwoSpeciesModel [
	"self new exampleRK4SolverOnMigrationTwoSpeciesModel"
	|model spatialConcern  SEIRSConcern multihostConcern|
	spatialConcern := self spatialConcern.
	SEIRSConcern := self SEIRSConcern.
	multihostConcern := self multiHostConcern.
	
	model := KEModel new.
	model integrate: spatialConcern.
	model integrate: multihostConcern.
	model integrate: SEIRSConcern.
	
	model atParameter: #beta assignValue: 1.
	model atParameter: #mu assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.000365 ].
		c = #bird ifTrue: [ val := 0.00137 ].
		val ].
	model atParameter: #sigma assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.5 ].
		c = #bird ifTrue: [ val := 0.67 ].
		val ].
	model atParameter: #gamma assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.25 ].
		c = #bird ifTrue: [ val := 0.233 ].
		val ].
	model atParameter: #v assignValue: 0.00274.
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := OrderedCollection new.
		c add: (aModel currentCompartment at: #patch).
		c add: (aModel currentCompartment at: #species).
		aModel sizeOfPopulation: (c asArray)
	].
	model atParameter: #rho assignValue: [ :aModel| |c val|
		c := aModel currentCompartment at: #species.
		c = #bird ifTrue: [ val := 0.1 ].
		c = #human ifTrue: [ val := 0.03 ].
		val
	].
	model addParameter: #delta value: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := #(0 0.21) ].
		c = #bird ifTrue: [ val := #(0 0.42) ].
		val
	]. 
	model atParameter: #lambda assignValue: [ :aModel| |c|
		c := aModel currentCompartment at: #patch.
		((aModel atParameter: #beta) *
		(aModel atParameter: #delta) *
		(aModel atCompartment: {#status->#I. #patch->c}) / (aModel atParameter: #N)) sum.
	].
	model 
		atCompartment: { #status->#S. #species->#bird. #patch->1 } 
		put: 4990
		atOthersPut: 0.
	model 
		atCompartment: { #status->#I. #species->#bird. #patch->1 } 
		put: 10.
	2 to: 5 do: [ :i| 
		model 
			atCompartment: { #status->#S. #species->#bird. #patch->i } 
			put: 5000.
	].
	1 to: 5 do: [ :i| 
		model 
			atCompartment: { #status->#S. #species->#human. #patch->i } 
			put: 500 
	].

	^ model
	
	 
	
	
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnMultiInfectiousStatusModel [
	"self new exampleRK4SolverOnMultiInfectiousStatusModel"
	|model|
	model := KEModel new.
	model attributes: {#status->#(S I Is R)}.
	model atCompartment: { #status->#S } put: 450.
	model atCompartment: { #status->#I } put: 10.
	model atCompartment: { #status->#Is } put: 40.
	model atCompartment: { #status->#R } put: 0.

	model addParameter: #beta1 value: 0.007.
	model addParameter: #beta2 value: 0.001.
	model addParameter: #delta value: 0.5.
	model addParameter: #gamma1 value: 0.5.
	model addParameter: #gamma2 value: 0.25.
	model 
		addTransitionFrom: {#status -> #S}
		to: {#status -> #I} 
		probability: [ :m| 
			((m atParameter: #beta1) * 
			(m atCompartment: {#status->#I})) +
			((m atParameter: #beta2) * 
			(m atCompartment: {#status->#Is})) ].
	model
		addTransitionFrom: {#status -> #I}
		to: {#status -> #Is} 
		probability: [ :m| m atParameter: #delta ].
	model 
		addTransitionFrom: {#status -> #I}
		to: {#status -> #R}
		probability: [ :m| m atParameter: #gamma1 ].
	model
		addTransitionFrom: {#status -> #Is} 
		to: {#status -> #R} 
		probability: [ :m| m atParameter: #gamma2 ].
		
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnMultiStrainModel [
	|model|
	model := KEModel new.
	model attributes: {#status->#(#S #I1 #I2 #R)}.
	model atCompartment: { #status->#S } put: 9900.
	model atCompartment: { #status->#I1 } put: 99.
	model atCompartment: { #status->#I2 } put: 1.
	model atCompartment: { #status->#R } put: 0.
	
	model addParameter: #beta1 value: 0.00002.
	model addParameter: #beta2 value: 0.00018.
	model addParameter: #gamma1 value: 0.1.
	model addParameter: #gamma2 value: 1.
	model addParameter: #mu value: 5e-5.
	
	model 
		addTransitionFrom: {#status -> #S}
		to: {#status -> #I1} 
		probability: [ :m| 
			(m atParameter: #beta1) * (m atCompartment: {#status->#I1}) ].
	model
		addTransitionFrom: {#status -> #S} 
		to: {#status -> #I2} 
		probability: [ :m| (m atParameter: #beta2) * (m atCompartment: {#status->#I2}) ].
	model
		addTransitionFrom: {#status -> #I1} 
		to: {#status -> #R} 
		probability: [ :m| (m atParameter: #gamma1) ].
	model
		addTransitionFrom: {#status -> #I2}
		to: {#status -> #R}
		probability: [ :m| (m atParameter: #gamma2) ].
	model
		addTransitionFrom: {#status -> #S}
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model 
		addTransitionFrom: {#status -> #I1}
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model 
		addTransitionFrom: {#status -> #I2} 
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model
		addTransitionFrom: {#status -> #R} 
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model
		addTransitionFrom: #empty 
		to: {#status -> #S} 
		probability: [ :m| (m atParameter: #mu) ].
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnMultipleRiskGroupsModel [
	"self new exampleRK4SolverOnMultipleRiskGroupsModel"
	| model riskGroupConcern |
	riskGroupConcern := self riskGroupConcern.
	model := KEModel new.
	model attributes: {#status->#(S I)}.
	model addParameter: #beta value: 16e-9.
	model addParameter: #gamma value: 0.2.
	model addParameter: #lambda value: 'beta*I'. 
	model addEquation: 'S:t=gamma*I-lambda*S'.
	model addEquation: 'I:t=lambda*S-gamma*I'.
	
	model integrate: riskGroupConcern.
	model addParameter: #rho value: [ :aModel| |c val|
		c := aModel currentCompartment at: #riskGroup.
		c = 1 ifTrue: [ val := #(0 0 0 0 0) ].
		c = 2 ifTrue: [ val := #(0 9 30 180 300) ].
		c = 3 ifTrue: [ val := #(0 30 100 600 1000) ].
		c = 4 ifTrue: [ val := #(0 180 600 3600 6000) ].
		c = 5 ifTrue: [ val := #(0 300 1000 6000 10000) ].
		val
	]. 
	model atParameter: #lambda assignValue: [:aModel| 
		((aModel atParameter: #beta) *
		(aModel atCompartment: {#status->#I}) *
		(aModel atParameter: #rho)) sum
	].
	model atCompartment: { #status->#I. #riskGroup->5 } put: 1 atOthersPut: 0.
	model atCompartment: { #status->#S. #riskGroup->1 } put: 6000.
	model atCompartment: { #status->#S. #riskGroup->2 } put: 31000.
	model atCompartment: { #status->#S. #riskGroup->3 } put: 52000.
	model atCompartment: { #status->#S. #riskGroup->4 } put: 8000.
	model atCompartment: { #status->#S. #riskGroup->5 } put: 2999.

	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnSEIRMeasles [
	"self new modelRK4SolverOnSEIRMeasles"

	| model |
	model := KEModel new.
	model attributes: {(#status -> #(S E I R))}.
	model atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	model
		addParameters:
			{(#beta -> 0.0000214).
			(#gamma -> 0.143).
			(#mu -> 0.0000351).
			(#sigma -> 0.125)}.
	model
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #E)}
		probability: [ :m | (m atParameter: #beta) * (m atCompartment: {(#status -> #I)}) ].
	model
		addTransitionFrom: {(#status -> #E)}
		to: {(#status -> #I)}
		probability: [ :m | m atParameter: #sigma ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: {(#status -> #R)}
		probability: [ :m | m atParameter: #gamma ].
	model
		addTransitionFrom: {(#status -> #S)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #R)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #E)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: #empty
		to: {(#status -> #S)}
		probability: [ :m | m atParameter: #mu ].
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnSEIRMeaslesModelWithVaccination [
	"self new modelRK4SolverOnSEIRMeaslesModelWithVaccination"

	| model |
	model := KEModel new.
	model attributes: {(#status -> #(S E I R))}.
	model atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	model
		addParameters:
			{(#beta -> 0.00782).
			(#gamma -> 52.14).
			(#mu -> 0.0128).
			(#sigma -> 45.625).
			(#p -> 0.7)}.
	model
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #E)}
		probability: [ :m | (m atParameter: #beta) * (m atCompartment: {(#status -> #I)}) ].
	model
		addTransitionFrom: {(#status -> #E)}
		to: {(#status -> #I)}
		probability: [ :m | m atParameter: #sigma ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: {(#status -> #R)}
		probability: [ :m | m atParameter: #gamma ].
	model
		addTransitionFrom: {(#status -> #S)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #R)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #E)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: #empty
		to: {(#status -> #S)}
		probability: [ :m | (m atParameter: #mu) * (1 - (m atParameter: #p)) ].
	model
		addTransitionFrom: #empty
		to: {(#status -> #R)}
		probability: [ :m | (m atParameter: #mu) * (m atParameter: #p) ].
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnSIRDemography [
	"self new modelRK4SolverOnSIRDemography"

	| model |
	model := KEModel new.
	model attributes: {(#status -> #(#S #I #R))}.
	model atCompartment: {(#status -> #S)} put: 4975.
	model atCompartment: {(#status -> #I)} put: 25.
	model atCompartment: {(#status -> #R)} put: 0.
	model addParameter: #beta value: 1 / 5000.
	model addParameter: #gamma value: 1 / 10.0.
	model addParameter: #mu value: 5e-4.
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S'.
	model addEquation: 'I:t=beta*S*I-gamma*I-mu*I'.
	model addEquation: 'R:t=gamma*I-mu*R'.
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnSIRMultiHost [
	"self new exampleRK4SolverOnSIRMultiHostModel"

	| model multiHostConcern |
	multiHostConcern := KEModelPart new.
	multiHostConcern
		addAttribute: #species
		value: #(#mosquito #reservoir1 #reservoir2).
	model := KEModel new.
	model attributes:{#status -> #(#S #I #R)}.
	model addParameter: #mu value: 12.17.
	model addParameter: #gamma value: 52.
	model addParameter: #beta value: 1.
	model
		addParameter: #lambda
		value: [ :aModel | 
			(aModel atParameter: #beta)
				* (aModel atCompartment: {(#status -> #I)}) ].
	model
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #I)}
		probability: [ :m | m atParameter: #lambda ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: {(#status -> #R)}
		probability: [ :m | m atParameter: #gamma ].
	model
		addTransitionFrom: {(#status -> #S)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: {(#status -> #R)}
		to: #empty
		probability: [ :m | m atParameter: #mu ].
	model
		addTransitionFrom: #empty
		to: {(#status -> #S)}
		probability: [ :m | m atParameter: #mu ].
	model integrate: multiHostConcern.
	model
		atParameter: #mu
		assignValue: [ :aModel | 
			| c val |
			c := aModel currentCompartment at: #species.
			c = #mosquito
				ifTrue: [ val := 12.17 ].
			c = #reservoir1
				ifTrue: [ val := 0.05 ].
			c = #reservoir2
				ifTrue: [ val := 0.05 ].
			val ].
	model
		atParameter: #N
		assignValue: [ :aModel | 
			| c |
			c := aModel currentCompartment at: #species.
			aModel sizeOfPopulation: c ].
	model
		addParameter: #rho
		value: [ :aModel | 
			| c val |
			c := aModel currentCompartment at: #species.
			c = #mosquito
				ifTrue: [ val := #(0 0.02 0.02) ].
			c = #reservoir1
				ifTrue: [ val := #(0.02 0 0) ].
			c = #reservoir2
				ifTrue: [ val := #(0.02 0 0) ].
			val ].
	model
		atParameter: #lambda
		assignValue: [ :aModel | 
			((aModel atParameter: #beta) * (aModel atParameter: #rho)
				* (aModel atCompartment: {(#status -> #I)})) sum ].
	model
		atCompartment:
			{(#status -> #S).
			(#species -> #mosquito)}
		put: 9999.
	model
		atCompartment:
			{(#status -> #I).
			(#species -> #mosquito)}
		put: 1.
	model
		atCompartment:
			{(#status -> #R).
			(#species -> #mosquito)}
		put: 0.
	model
		atCompartment:
			{(#status -> #S).
			(#species -> #reservoir1)}
		put: 1000.
	model
		atCompartment:
			{(#status -> #I).
			(#species -> #reservoir1)}
		put: 0.
	model
		atCompartment:
			{(#status -> #R).
			(#species -> #reservoir1)}
		put: 0.
	model
		atCompartment:
			{(#status -> #S).
			(#species -> #reservoir2)}
		put: 2000.
	model
		atCompartment:
			{(#status -> #I).
			(#species -> #reservoir2)}
		put: 0.
	model
		atCompartment:
			{(#status -> #R).
			(#species -> #reservoir2)}
		put: 0.
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnSIRMultiHostModelTransitionByRate [
	"self new exampleRK4SolverOnSIRMultiHostModelTransitionByRate"

	| model  multiHostConcern|
	multiHostConcern := KEModelPart new.
	multiHostConcern 
		addAttribute: #species 
		value: #(#mosquito #reservoir1 #reservoir2).
	model := KEModel new.
	model attributes: {(#status -> #(#S #I #R))}.
	model addParameter: #mu value: 12.17.
	model addParameter: #gamma value: 52.
	model addParameter: #beta value: 1.
	model addParameter: #lambda value: [ :aModel| 
		(aModel atParameter: #beta) * 
		(aModel atCompartment: {#status->#I}) ].
	model 
		addTransitionFrom: {#status -> #S}
		to: {#status -> #I} 
		probability: 'lambda' parseAsAnExpression.
	model 
		addTransitionFrom: {#status -> #I} 
		to: {#status -> #R} 
		probability: 'gamma' parseAsAnExpression.
	model 
		addTransitionFrom: {#status -> #S}
		to: #empty 
		probability: 'mu' parseAsAnExpression.
	model 
		addTransitionFrom: {#status -> #I} 
		to: #empty 
		probability: 'mu' parseAsAnExpression.
	model 
		addTransitionFrom: {#status -> #R}
		to: #empty 
		probability: 'mu' parseAsAnExpression.
	model 
		addTransitionFrom: #empty 
		to: {#status -> #S} 
		probability: 'mu' parseAsAnExpression.
		
	model integrate: multiHostConcern.	
	model 
		atParameter: #mu
		assignValue: 
		[ :aModel| |c val| 
			c := aModel currentCompartment at: #species.
			c = #mosquito ifTrue: [ val := 12.17 ].
			c = #reservoir1 ifTrue: [ val := 0.05 ].
			c = #reservoir2 ifTrue: [ val := 0.05 ].
			val
		].
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := aModel currentCompartment at: #species.
		aModel sizeOfPopulation: c
		].
	model addParameter: #rho value: [ :aModel| |c val|
		c := aModel currentCompartment at: #species.
		c = #mosquito ifTrue: [ val := #(0 0.02 0.02) ].
		c = #reservoir1 ifTrue: [ val := #(0.02 0 0) ].
		c = #reservoir2 ifTrue: [ val := #(0.02 0 0) ].
		val
		].
	model atParameter: #lambda assignValue: [ :aModel|
		((aModel atParameter: #beta) * 
		(aModel atParameter: #rho) * 
		(aModel atCompartment: {#status->#I})) sum
		].
	model atCompartment: { #status->#S. #species->#mosquito } put: 9999.
	model atCompartment: { #status->#I. #species->#mosquito } put: 1.
	model atCompartment: { #status->#R. #species->#mosquito } put: 0.
	model atCompartment: { #status->#S. #species->#reservoir1 } put: 1000.
	model atCompartment: { #status->#I. #species->#reservoir1 } put: 0.
	model atCompartment: { #status->#R. #species->#reservoir1 } put: 0.
	model atCompartment: { #status->#S. #species->#reservoir2 } put: 2000.
	model atCompartment: { #status->#I. #species->#reservoir2 } put: 0.
	model atCompartment: { #status->#R. #species->#reservoir2 } put: 0.
	
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnSIRMultiHostModelWithODERepresentation [
	"self new exampleRK4SolverOnSIRMultiHostModelWithODERepresentation"
	| model  multiHostConcern|
	multiHostConcern := KEModelPart new.
	multiHostConcern 
		addAttribute: #species 
		value: #(#mosquito #reservoir1 #reservoir2).
	model := KEModel new.
	model attributes: {(#status -> #(#S #I #R))}.
	model addParameter: #mu value: 12.17.
	model addParameter: #gamma value: 52.
	model addParameter: #beta value: 1.
	model addParameter: #lambda value: [ :aModel| 
		(aModel atParameter: #beta) * 
		(aModel atCompartment: {#status->#I}) ].
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S'.
	model addEquation: ('I:t=beta*S*I-(mu+gamma)*I').
	model addEquation: ('R:t=gamma*I-mu*R').
	
	model integrate: multiHostConcern.	
	model 
		atParameter: #mu
		assignValue: 
		[ :aModel| |c val| 
			c := aModel currentCompartment at: #species.
			c = #mosquito ifTrue: [ val := 12.17 ].
			c = #reservoir1 ifTrue: [ val := 0.05 ].
			c = #reservoir2 ifTrue: [ val := 0.05 ].
			val
		].
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := aModel currentCompartment at: #species.
		aModel sizeOfPopulation: c
		].
	model addParameter: #rho value: [ :aModel| |c val|
		c := aModel currentCompartment at: #species.
		c = #mosquito ifTrue: [ val := #(0 0.02 0.02) ].
		c = #reservoir1 ifTrue: [ val := #(0.02 0 0) ].
		c = #reservoir2 ifTrue: [ val := #(0.02 0 0) ].
		val
		].
	model atParameter: #lambda assignValue: [ :aModel|
		((aModel atParameter: #beta) * 
		(aModel atParameter: #rho) * 
		(aModel atCompartment: {#status->#I})) sum
		].
	model atCompartment: { #status->#S. #species->#mosquito } put: 9999.
	model atCompartment: { #status->#I. #species->#mosquito } put: 1.
	model atCompartment: { #status->#R. #species->#mosquito } put: 0.
	model atCompartment: { #status->#S. #species->#reservoir1 } put: 1000.
	model atCompartment: { #status->#I. #species->#reservoir1 } put: 0.
	model atCompartment: { #status->#R. #species->#reservoir1 } put: 0.
	model atCompartment: { #status->#S. #species->#reservoir2 } put: 2000.
	model atCompartment: { #status->#I. #species->#reservoir2 } put: 0.
	model atCompartment: { #status->#R. #species->#reservoir2 } put: 0.
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnSIRSimpleModel [
	"self new modelRK4SolverOnSIRSimpleModel"

	| model |
	model := KEModel new.
	model attributes: 
		{#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 99999.
	model atCompartment: { #status->#I } put: 1.
	model atCompartment: { #status->#R } put: 0.
	model addParameters: {#beta->0.0052. #gamma->52}.
	model
		addTransitionFrom: {#status -> #S}
		to: {#status -> #I}
		probability: [ :m | 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I}) ].
	model addTransitionFrom:  {#status -> #I}
			to: {#status -> #R} 
			probability: [ :m | m atParameter: #gamma ].
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnSIRSimpleModelWithODERepresentation [
	"self new modelRK4SolverOnSIRSimpleModelWithODERepresentation"

	| model |
	model := KEModel new.
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 99999.
	model atCompartment: { #status->#I } put: 1.
	model atCompartment: { #status->#R } put: 0.
		
	model addParameters: {#beta->0.0052. #gamma->52}.
	model addEquation: 'S:t=-beta*S*I'.
	model addEquation: 'I:t=beta*S*I - gamma*I'.
	model addEquation: 'R:t=gamma*I'.
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnSIRSimpleModelWithTransitionProbabilityAsExpression [
	"self new exampleRK4SolverOnSIRSimpleModel"
	| model |
	model := KEModel new.
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->0.0052. #gamma->52}.
	model addTransitionFrom: {#status -> #S}
		to: {#status -> #I}
		probability: 'beta*I' parseAsAnExpression.
	model addTransitionFrom: {#status -> #I}
		to: {#status -> #R}
		probability: 'gamma' parseAsAnExpression.
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> modelRK4SolverOnSeasonalForcingModel [
	"self new exampleRK4SolverOnSeasonalForcingModel"

	| model |
	model := KEModel new.
	model attributes: { #status->#(#S #E #I #R) }.
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {
		#beta0->0.0052.
		#gamma->52. 
		#sigma->52. 
		#betaAmp->0.3.
		#mu->0.0125}.
	model
		addParameter: #beta 
		value: 'beta0*(1 + (betaAmp*cos(t)))'.
	model 
		addEquation: 'S:t=mu*N-beta*S*I-mu*S'.
	model 
		addEquation: 'E:t=beta*S*I-sigma*E-mu*E'.
	model 
		addEquation: 'I:t=sigma*E-gamma*I-mu*I'.
	model 
		addEquation: 'R:t=gamma*I-mu*R'.
	^ model
]

{ #category : #examples }
KEDeterministicExamples >> multiHostConcern [

	| multiHostConcern |
	multiHostConcern := KEModelPart new.
	multiHostConcern 
		addAttribute: #species 
		value: #(#human #bird).
		
	^ multiHostConcern 
]

{ #category : #examples }
KEDeterministicExamples >> riskGroupConcern [

	| riskGroupConcern |
	riskGroupConcern := KEModelPart new.
	riskGroupConcern 
		addAttribute: #riskGroup 
		value: (1 to: 5) asArray.
		
	^ riskGroupConcern 
]

{ #category : #examples }
KEDeterministicExamples >> spatialConcern [
	"self new exampleRK4SolverOnMigrationMultiSpeciesModel"
	| spatialConcern|
	spatialConcern := KEModelPart new.
	spatialConcern addAttribute: #patch value: (1 to: 5) asArray.
	spatialConcern addParameter: #rho.
	(1 to: 5) do: [ :i| 
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
	]. 
	
	^ spatialConcern 
	
	 
	
	
]
