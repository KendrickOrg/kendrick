Class {
	#name : #KEIndividualBasedExamples,
	#superclass : #KEExamples,
	#category : #'Kendrick-Examples'
}

{ #category : #examples }
KEIndividualBasedExamples >> exampleIBMSimulatorOnSEIRMeaslesModel [
	"self new exampleIBMSimulatorOnSEIRMeaslesModel"

	| model simulator chart |
	model := KEModel new.
	model attributes: {#status -> #(S E I R)}.
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
	simulator := KESimulator
		new: #IBM
		from: 0.0
		to: 150
		step: 1.
	simulator executeOn: model.
	chart := KEChart new addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	chart plot 
]

{ #category : #examples }
KEIndividualBasedExamples >> exampleIBMSimulatorOnSIREbolaModel [
	"self new exampleIBMSimulatorOnSIREbolaModel"

	| model simulator chart spatialConcern countries |
	spatialConcern := KEModelPart new.
	spatialConcern addAttribute: #country value: #(#Liberia #Guinea #SierraLeone #Nigeria #Senegal #Niger).
	spatialConcern addParameter: #rho.
	countries := spatialConcern atAttribute: #country.
	1 to: 5 do: [ :i | 
		i + 1 to: 6 do: [ :j | 
			spatialConcern addTransitionFrom: {(#country -> (countries at: i))} to: {(#country -> (countries at: j))} probability: [ :aModel | aModel atParameter: #rho ].
			spatialConcern addTransitionFrom: {(#country -> (countries at: j))} to: {(#country -> (countries at: i))} probability: [ :aModel | aModel atParameter: #rho ] ] ].
	model := KEModel new.
	model population.
	model addAttribute: #status value: #(S I R).
	model addParameter: #gamma value: 0.1.
	model addParameter: #beta value: 0.0002.
	model addParameter: #lambda value: [ :aModel | (aModel atParameter: #beta) * (aModel atCompartment: {(#status -> #I)}) ].
	model addEquation: 'S:t=-lambda*S'.
	model addEquation: 'I:t=lambda*S-gamma*I'.
	model addEquation: 'R:t=gamma*I'.
	model integrate: spatialConcern.
	model
		atParameter: #N
		assignValue: [ :aModel | 
			| c |
			c := aModel currentCompartment at: #country.
			aModel sizeOfPopulation: c ].
	model
		atParameter: #lambda
		assignValue: [ :aModel | 
			| c |
			c := aModel currentCompartment at: #country.
			(aModel atParameter: #beta)
				*
					(aModel
						atCompartment:
							{(#status -> #I).
							(#country -> c)}) ].
	model atParameter: #rho assignValue: 0.05.
	model
		atCompartment:
			{(#status -> #I).
			(#country -> #Liberia)}
		put: 50
		atOthersPut: 0.
	countries
		do: [ :each | 
			each = #Liberia
				ifTrue: [ model
						atCompartment:
							{(#status -> #S).
							(#country -> #Liberia)}
						put: 950 ]
				ifFalse: [ model
						atCompartment:
							{(#status -> #S).
							(#country -> each)}
						put: 1000 ] ].
	simulator := KESimulator
		new: #IBM
		from: 0.0
		to: 100
		step: 0.1.
	simulator executeOn: model.
	chart := KEChart new addDataFrame:  (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	chart plot.
	"chart openMap: #africa countries: (model atAttribute: #country) coloredBy: #peakOfEpidemic"
]

{ #category : #examples }
KEIndividualBasedExamples >> exampleIBMSimulatorOnSIRModel [
	"self new exampleIBMSimulatorOnSIRModel"

	| model simulator chart |
	model := KEModel new.
	model attributes:{#status -> #(#S #I #R)}.
	model atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	model
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)}.
	model
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #I)}
		probability: [ :m | (m atParameter: #beta) * (m atCompartment: {(#status -> #I)}) ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: {(#status -> #R)}
		probability: [ :m | m atParameter: #gamma ].
	simulator := KESimulator
		new: #IBM
		from: 0.0
		to: 1.0
		step: 0.0027.
	simulator executeOn: model.
	chart := KEChart new addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	chart plot 
]

{ #category : #examples }
KEIndividualBasedExamples >> exampleIBMSimulatorOnSIRModel2 [
	"self new exampleIBMSimulatorOnSIRModel2"

	| model simulator chart |
	model := KEModel new.
	model attributes:{#status -> #(#S #I #R)}.
	model atCompartment: {(#status -> #S)} put: 99 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	model
		addParameters:
			{(#beta -> 0.01).
			(#gamma -> 0.1)}.
	model
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #I)}
		probability: [ :aModel | 
			(aModel atParameter: #beta)
				* (aModel atCompartment: {(#status -> #I)}) ].
	model
		addTransitionFrom: {(#status -> #I)}
		to: {(#status -> #R)}
		probability: [ :m | m atParameter: #gamma ].
	simulator := KESimulator
		new: #IBM
		from: 0.0
		to: 50
		step: 0.1.
	simulator executeOn: model.
	chart := KEChart new addDataFrame:  (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	chart plot 
]

{ #category : #examples }
KEIndividualBasedExamples >> exampleIBMSimulatorOnSIRModelWithBansalIdea [
	"self new exampleIBMSimulatorOnSIRModelWithBansalIdea"

	| model network spatialConcern sirConcern simulator chart f |
	model := KEModel new.
	sirConcern := KEModelPart new.
	sirConcern attributes: {#status -> #(S I R)}.
	sirConcern addParameters: {#beta . #gamma . #lambda}.
	sirConcern
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #I)}
		probability: 'lambda'.
	sirConcern
		addTransitionFrom: {(#status -> #I)}
		to: {(#status -> #R)}
		probability: 'gamma'.
	spatialConcern := KEModelPart new.
	network := KEContactNetwork
		nodes: 100
		topology:
			{#random.
			(#p -> 1)}.
	network generateTransitions: spatialConcern.
	spatialConcern addParameter: #network value: network.
	spatialConcern addAttribute: #node value: network allContacts.
	spatialConcern addParameter: #allConnects value: network edges size.
	spatialConcern
		addParameter: #iota
		value: [ :aModel | 
			((aModel atParameter: #network)
				edgesFrom:
					{aModel.
					#I}) / (aModel atParameter: #allConnects) ].
	model integrate: sirConcern.
	model integrate: spatialConcern.
	model
		atParameter: #lambda
		assignValue:
			[ :aModel | (aModel atParameter: #iota) * (aModel atParameter: #beta) ].
	model atParameter: #beta assignValue: 1.
	model atParameter: #gamma assignValue: 0.1.
	1 to: 99 do: [ :i | 
		model
			atCompartment:
				{(#status -> #S).
				(#node -> i asString asSymbol)}
			put: 1 ].
	model
		atCompartment:
			{(#status -> #I).
			(#node -> #'100')}
		put: 1.
	simulator := KESimulator
		new: #IBM
		from: 0.0
		to: 50
		step: 0.1.
	simulator executeOn: model.
	f := [ :name | 
	| d tmp |
	tmp := (simulator timeSeriesOutputsAt: name)
		collect: [ :e | e value ].
	d := OrderedCollection new.
	1 to: tmp first data size do: [ :k | d add: (tmp collect: [ :e | e data at: k ]) sum ].
	(KETimeSeries from: d withIndex: tmp first index)
		compartment: (STON fromString: name) ].
	chart := KEChart new addDataFrame: {(f value: '{#status:#I}')}.
	chart plot
]

{ #category : #examples }
KEIndividualBasedExamples >> exampleIBMSimulatorOnSIRModelWithContactNetworkAmongIndividuals [
	"self new exampleIBMSimulatorOnSIRModelWithContactNetworkAmongIndividuals"

	| model network spatialConcern sirConcern simulator chart |
	model := KEModel new.
	sirConcern := KEModelPart new.
	sirConcern addAttribute: #status value: #(S I R).
	sirConcern addParameters: {#beta . #gamma . #lambda}.
	sirConcern addTransitionFrom: {(#status -> #S)} to: {(#status -> #I)} probability: 'lambda'.
	sirConcern addTransitionFrom: {(#status -> #I)} to: {(#status -> #R)} probability: 'gamma'.
	spatialConcern := KEModelPart new.
	network := KEContactNetwork
		nodes: 100
		topology:
			{#random.
			(#p -> 1)}.
	spatialConcern addParameter: #network value: network.
	spatialConcern addAttribute: #node value: network allContacts.
	model integrate: sirConcern.
	model integrate: spatialConcern.
	model
		atParameter: #lambda
		assignValue: [ :aModel | 
			| node |
			node := aModel currentCompartment at: #node.
			((aModel atParameter: #network)
				contactsOf:
					{aModel.
					(#node -> node).
					(#status -> #I)}) * (aModel atParameter: #beta) / (aModel atParameter: #N) ].
	model atParameter: #beta assignValue: 1.
	model atParameter: #gamma assignValue: 0.1.
	1 to: 99 do: [ :i | 
		model
			atCompartment:
				{(#status -> #S).
				(#node -> i asString asSymbol)}
			put: 1 ].
	model
		atCompartment:
			{(#status -> #I).
			(#node -> #'100')}
		put: 1.
	simulator := KESimulator
		new: #IBM
		from: 0.0
		to: 50
		step: 0.1.
	simulator executeOn: model.

	chart := KEChart new addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	chart plotHistogram 
]

{ #category : #examples }
KEIndividualBasedExamples >> exampleIBMSimulatorOnSIRMultiHostModel [
	"self new exampleIBMSimulatorOnSIRMultiHostModel"

	| model multiHostConcern simulator chart |
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
	simulator := KESimulator
		new: #IBM
		from: 0.0
		to: 0.5
		step: 0.0027.
	simulator executeOn: model.
	chart := KEChart new addDataFrame: (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	chart plotSqrt
]

{ #category : #examples }
KEIndividualBasedExamples >> exampleIBM_SIR_Bansal_ScaleFree [
	"self new exampleIBM_SIR_Bansal_ScaleFree"
	"You can access the file network100.dat at: https://github.com/thanhbka85dn/kendrick/blob/master/network100.dat"
	"Respectively, network1000.dat at: https://github.com/thanhbka85dn/kendrick/blob/master/network1000.dat"
	"Scale free network with 10000 individual, network.dat at: https://github.com/thanhbka85dn/kendrick/blob/master/network.dat"
	"Note that all scale networks above have p(k) ~ 'k to the minus 1.875 power'"
	|model network spatialConcern sirConcern simulator chart f|
	model := KEModel new.
	sirConcern := KEModelPart new.
	sirConcern addAttribute: #status value: #(S I R).
	sirConcern addParameters: { #beta. #gamma. #lambda }.
	sirConcern addTransitionFrom: { #status->#S } to: { #status->#I } probability: 'lambda'.
	sirConcern addTransitionFrom: { #status->#I } to: { #status->#R } probability: 'gamma'.
	spatialConcern := KEModelPart new.
	network := KEContactNetwork new.
	network loadNodes: 10000 fromFile: 'assets/data/network.dat'.
	
	spatialConcern addParameter: #network value: network.
	
	network generateTransitions: spatialConcern.
	spatialConcern addAttribute: #node value: network allContacts.
	spatialConcern addParameter: #iota value: [ :aModel|
		((aModel atParameter: #network) edgesFrom: {aModel. #I}) / "((aModel atParameter: #network) edges size)"
		
				((aModel atParameter: #network) numberOfEdges)
				.
	 ].
	model integrate: sirConcern.
	model integrate: spatialConcern.
	model atParameter: #lambda assignValue: [ :aModel|
		(aModel atParameter: #iota)*(aModel atParameter: #beta)
	 ].
	model atParameter: #beta assignValue: 1.
	model atParameter: #gamma assignValue: 0.1.
	1 to: 9999 do: [:i| model atCompartment: {#status->#S. #node->i asString asSymbol} put: 1].
	model atCompartment: { #status->#I. #node->#'10000' } put: 1.
	simulator := KESimulator new: #IBM from: 0.0 to: 50 step: 0.5.
	simulator executeOn: model.
	f := [:name| |d tmp|
		tmp := (simulator timeSeriesOutputsAt: name) collect: [ :e| e value ].
		d := OrderedCollection new.
		1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
		(KETimeSeries from: d withIndex: tmp first index) compartment: (STON fromString: name)
		].
	chart := KEChart new addDataFrame:  { (f value: '{#status:#I}') }.
	chart plot.
]

{ #category : #examples }
KEIndividualBasedExamples >> exampleNetWorkSimulatorOnSIR [
"self new exampleNetWorkSimulatorOnSIR"
"Problem to debug to this method due to Dataframe apparently"
	| model network spatialConcern sirConcern simulator db data |
	model := KEModel new.
	sirConcern := KEModelPart new.
	sirConcern addAttribute: #status value: #(S I R).
	sirConcern addParameters: {#beta . #gamma . #lambda}.
	sirConcern addTransitionFrom: {(#status -> #S)} to: {(#status -> #I)} probability: 'lambda'.
	sirConcern addTransitionFrom: {(#status -> #I)} to: {(#status -> #R)} probability: 'gamma'.
	spatialConcern := KEModelPart new.
	network := KEContactNetwork
		nodes: 100
		topology:
			{#random.
			(#p -> 0.02)}.
	spatialConcern addParameter: #network value: network.
	spatialConcern addAttribute: #node value: network allContacts.
	model integrate: sirConcern.
	model integrate: spatialConcern.
	model
		atParameter: #lambda
		assignValue: [ :aModel | 
			| node |
			node := aModel currentCompartment at: #node.
			((aModel atParameter: #network)
				contactsOf:
					{aModel.
					(#node -> node).
					(#status -> #I)}) * (aModel atParameter: #beta) / (aModel atParameter: #N) ].
	model atParameter: #beta assignValue: 100.
	model atParameter: #gamma assignValue: 0.1.
	1 to: 99 do: [ :i | 
		model
			atCompartment:
				{(#status -> #S).
				(#node -> i asString asSymbol)}
			put: 1 ].
	model
		atCompartment:
			{(#status -> #I).
			(#node -> #'100')}
		put: 1.
	simulator := KESimulator
		new: #IBM
		from: 0.0
		to: 50
		step: 0.1.
	simulator executeOn: model.
	data := OrderedCollection new.
	data add: (simulator timeSeriesOutputsAt: {(#status -> #I)}).
	db := KEDiagramBuilder new data: data.
	db open.
	db := KENetworkBuilder new
		data: simulator timeSeriesOutputs;
		network: (model atParameter: #network);
		status: #(#S #I #R);
		colors: #(#green #red #blue);
		viewDataAtTime: 12.5;
		legend: 'random network, p = 0.02'.
	db open
]
