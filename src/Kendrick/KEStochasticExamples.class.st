Class {
	#name : #KEStochasticExamples,
	#superclass : #KEExamples,
	#category : 'Kendrick-Examples'
}

{ #category : #examples }
KEStochasticExamples >> exampleExplicitTauLeapOnSIRSimpleModel [
	"self new exampleExplicitTauLeapOnSIRSimpleModel"
	|model simulator  dB |
	model := KEModel new population: (KEPopulation size: 5000).
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 4975 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 25.
	model addParameters: {#beta->0.073. #gamma->36.5. #mu->0.01825}.

	model addTransitionFrom: '{#status: #S}' 
			to: '{#status: #I}' 
			probability: [ :aModel| 
				(aModel atParameter: #beta) *
				(aModel atCompartment: {#status->#I}) ].	
	model addTransitionFrom: '{#status: #I}' 
			to: '{#status: #R}' 
			probability: [:aModel| (aModel atParameter: #gamma)].
	model addTransitionFrom: '{#status: #S}' 
			to: #empty 
			probability: [:aModel| (aModel atParameter: #mu)].
	model addTransitionFrom: '{#status: #I}' 
			to: #empty 
			probability: [:aModel| (aModel atParameter: #mu)].
	model addTransitionFrom: '{#status: #R}' 
			to: #empty 
			probability: [:aModel| (aModel atParameter: #mu)].
	model addTransitionFrom: #empty 
	 		to: '{#status: #S}' 
			probability: [:aModel| (aModel atParameter: #mu)].
	simulator := KESimulator new: #TauLeap from: 0 to: 0.4 step: 0.0027.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator timeSeriesOutputs.
	^ dB open
	
	
]

{ #category : #examples }
KEStochasticExamples >> exampleGillespieDirectOnSEIRMeaslesModel [
	"self new exampleGillespieDirectOnSEIRMeaslesModel"
	|model simulator  diag |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {#status->#(#S #E #I #R)}.
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.	
	model addParameters: {#beta->0.00782. #gamma->52.14. #mu->0.0128. #sigma->45.625}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #E}'
		probability: [:m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I})].
	model addTransitionFrom: '{#status: #E}'
		to: '{#status: #I}'
		probability: [:m| (m atParameter: #sigma)].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [:m| (m atParameter: #gamma)].
	model addTransitionFrom: '{#status: #S}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #I}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #R}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #E}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: #empty
		to: '{#status: #S}'
		probability: [:m| (m atParameter: #mu)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	diag := (KEDiagramBuilder new) data: (simulator timeSeriesOutputsAt: '{#status: #I}').
	^ diag open
	
	
	
]

{ #category : #examples }
KEStochasticExamples >> exampleGillespieDirectOnSIRBioPEPAModel [
	"self new exampleGillespieDirectOnSIRBioPEPAModel"
	|model  simulator  dB |
	model := KEModel new population: (KEPopulation size: 100).
	model addAttribute: #status value: #(S I R).
	model atCompartment: { #status->#S } put: 99 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->1.4247. #gamma->0.1429}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I})].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (m atParameter: #gamma)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 100 step: 1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator timeSeriesOutputsAt: '{#status: #I}').
	^ dB view
	
	
]

{ #category : #examples }
KEStochasticExamples >> exampleGillespieDirectOnSIRMultiHostModel [
	"self new exampleGillespieDirectOnSIRMultiHostModel"
	| model multiHostConcern simulator db |
	
	multiHostConcern := KEModelPart new.
	multiHostConcern 
		addAttribute: #species 
		value: #(#mosquito #reservoir1 #reservoir2).
	
	model := KEModel new.
	model population: (KEPopulation size: 13000).
	model addAttribute: #status value: #(#S #I #R).
	model addParameter: #mu value: 12.17.
	model addParameter: #gamma value: 52.
	model addParameter: #beta value: 1.
	model addParameter: #lambda value: [ :aModel| 
		(aModel atParameter: #beta) * 
		(aModel atCompartment: {#status->#I}) ].
	model
		addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m | m atParameter: #lambda ].
	model 
		addTransitionFrom: '{#status: #I}' 
		to: '{#status: #R}' 
		probability: [ :m | m atParameter: #gamma ].
	model 
		addTransitionFrom: '{#status: #S}' 
		to: #empty 
		probability: [ :m | m atParameter: #mu ].
	model 
		addTransitionFrom: '{#status: #I}' 
		to: #empty 
		probability: [ :m | m atParameter: #mu ].
	model 
		addTransitionFrom: '{#status: #R}' 
		to: #empty 
		probability: [ :m | m atParameter: #mu ].
	model 
		addTransitionFrom: #empty 
		to: '{#status: #S}' 
		probability: [ :m | m atParameter: #mu ].
		
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
	model atParameter: #beta assignValue: [ :aModel| |c val|
		c := aModel currentCompartment at: #species.
		c = #mosquito ifTrue: [ val := #(0 0.02 0.02) ].
		c = #reservoir1 ifTrue: [ val := #(0.02 0 0) ].
		c = #reservoir2 ifTrue: [ val := #(0.02 0 0) ].
		val
		].
	model atParameter: #lambda assignValue: [ :aModel|
		((aModel atParameter: #beta) * 
		(aModel atCompartment: {#status->#I})) sum
		].
	model atCompartment: { #status->#S. #species->#mosquito } put: 9999.
	model atCompartment: { #status->#I. #species->#mosquito } put: 1.
	model atCompartment: { #status->#S. #species->#reservoir1 } put: 1000.
	model atCompartment: { #status->#S. #species->#reservoir2 } put: 2000.

	simulator := KESimulator new: #Gillespie from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	db := (KEDiagramBuilder new) data: ((simulator timeSeriesOutputsAt: '{#status: #I}') sqrt).
	db xLabel: 'Time (year)'.
	db yLabel: 'sqrt(Infectious)'.
	^ db open
	
]

{ #category : #examples }
KEStochasticExamples >> exampleGillespieDirectOnSIRSimpleModel [
	"self new exampleGillespieDirectOnSIRSimpleModel"
	|model simulator dB |
	model := KEModel new population: (KEPopulation size: 10000).
	model addAttribute: #status value: #(#S #I #R).
	model atCompartment: { #status->#S } put: 9999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->520. #gamma->52}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I}) / (m atParameter: #N)].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (model atParameter: #gamma)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 1.0 step: 0.001.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator timeSeriesOutputs.
	^ dB open
	
	
]

{ #category : #examples }
KEStochasticExamples >> exampleGillespieDirectOnSIRSimpleModel3 [
	"self new exampleGillespieDirectOnSIRSimpleModel3"
	|model  simulator dB |
	model := KEModel new population: (KEPopulation size: 100).
	model addAttribute: #status value: #(#S #I #R).
	model atCompartment: { #status->#S } put: 99 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->0.01. #gamma->0.1}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I})].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (m atParameter: #gamma)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 200 step: 0.01.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator timeSeriesOutputs.
	^ dB view
	
	
]

{ #category : #examples }
KEStochasticExamples >> exampleGillespieDirectOnSIRSimpleModelIcon [
	^ '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
AABJRU5ErkJggg=='
	
]

{ #category : #examples }
KEStochasticExamples >> exampleGillespieDirectOnSIRSimpleModelWithODERepresentation [
	"self new exampleGillespieDirectOnSIRSimpleModelWithODERepresentation"
	|model  simulator dB |
	model := KEModel new population: (KEPopulation size: 100000).
	model addAttribute: #status value: #(#S #I #R).
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->0.0052. #gamma->52}.
	model addEquation: 'S:t=-beta*S*I'.
	model addEquation: 'I:t=beta*S*I - gamma*I'.
	model addEquation: 'R:t=gamma*I'.
	simulator := KESimulator new: #Gillespie from: 0.0 to: 1.0 step: 0.001.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator timeSeriesOutputs.
	^ dB view
	
	
]

{ #category : #examples }
KEStochasticExamples >> exampleGillespieSimulatorOnSIREbolaModel [
	"self new exampleGillespieSimulatorOnSIREbolaModel"
	|model simulator db spatialConcern countries|
	spatialConcern := KEModelPart new.
	spatialConcern addAttribute: #country value: #(#Liberia #Guinea #SierraLeone #Nigeria #Senegal #Niger).
	spatialConcern addParameter: #rho.
	countries := spatialConcern atAttribute: #country.
	1 to: 5 do: [ :i| 
		(i+1) to: 6 do: [ :j| 
			spatialConcern 
				addTransitionFrom: { #country->(countries at: i) } 
				to: { #country->(countries at: j) } 
				probability: [ :aModel| aModel atParameter: #rho ].
			spatialConcern 
				addTransitionFrom: { #country->(countries at: j) } 
				to: { #country->(countries at: i) } 
				probability: [ :aModel| aModel atParameter: #rho ]
			].
		]. 
	
	model := KEModel new.
	model population: (KEPopulation size: 6000).
	model addAttribute: #status value: #(S I R).
	model addParameter: #gamma value: 0.1.
	model addParameter: #beta value: 0.0002.
	model addParameter: #lambda value: [ :aModel| 
		(aModel atParameter: #beta) *
		(aModel atCompartment: {#status->#I})
		]. 
	model addEquation: ('S:t=-lambda*S').
	model addEquation: ('I:t=lambda*S-gamma*I').
	model addEquation: ('R:t=gamma*I').
	
	model integrate: spatialConcern.
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := aModel currentCompartment at: #country.
		aModel sizeOfPopulation: c
		].
	model atParameter: #rho assignValue: 0.05.
	model atParameter: #lambda assignValue: [ :aModel|
		|c|
		c := aModel currentCompartment at: #country.
		(aModel atParameter: #beta) *
		(aModel atCompartment: {#status->#I. #country->c})
		 ].
	model atCompartment: { #status->#I. #country->#Liberia } put: 50 atOthersPut: 0.
	countries do: [ :each| 
		each = #Liberia 
		ifTrue: [ model atCompartment: { #status->#S. #country->#Liberia } put: 950 ]
		ifFalse: [model atCompartment: { #status->#S. #country->each } put: 1000 ]
	].
	
	simulator := KESimulator new: #Gillespie from: 0.0 to: 100 step: 0.1.
	simulator executeOn: model.
	"(simulator timeSeriesAt: '{#status:#I,#country:#Liberia}') first save: 'Liberia.txt'."
	db := (KEDiagramBuilder new) data: (simulator timeSeriesOutputsAt: '{#status: #	I}').
	db open.
	db openMap: #africa 
	   countries: (model atAttribute: #country) 
	   coloredBy: #peakOfEpidemic
]

{ #category : #examples }
KEStochasticExamples >> label [
	^ 'Stochastic examples'
]
