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

	model addTransitionFrom: {#status -> #S}
			to: {#status -> #I} 
			probability: [ :aModel| 
				(aModel atParameter: #beta) *
				(aModel atCompartment: {#status->#I}) ].	
	model addTransitionFrom: {#status -> #I}
			to: {#status -> #R} 
			probability: [:aModel| (aModel atParameter: #gamma)].
	model addTransitionFrom: {#status -> #S} 
			to: #empty 
			probability: [:aModel| (aModel atParameter: #mu)].
	model addTransitionFrom: {#status -> #I}
			to: #empty 
			probability: [:aModel| (aModel atParameter: #mu)].
	model addTransitionFrom: {#status -> #R}
			to: #empty 
			probability: [:aModel| (aModel atParameter: #mu)].
	model addTransitionFrom: #empty 
	 		to: {#status -> #S}
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
	model addTransitionFrom: {#status -> #S}
		to: {#status -> #E}
		probability: [:m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I})].
	model addTransitionFrom: {#status -> #E}
		to: {#status -> #I}
		probability: [:m| (m atParameter: #sigma)].
	model addTransitionFrom: {#status -> #I}
		to: {#status -> #R}
		probability: [:m| (m atParameter: #gamma)].
	model addTransitionFrom: {#status -> #S}
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: {#status -> #I}
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: {#status -> #R}
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: {#status -> #E}
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: #empty
		to: {#status -> #S}
		probability: [:m| (m atParameter: #mu)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	diag := (KEDiagramBuilder new) data: (simulator timeSeriesOutputsAt: {#status -> #I}).
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
	model addTransitionFrom: {#status -> #S}
		to: {#status -> #I}
		probability: [ :m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I})].
	model addTransitionFrom: {#status -> #I}
		to: {#status -> #R}
		probability: [ :m| (m atParameter: #gamma)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 100 step: 1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator timeSeriesOutputsAt: {#status -> #I}).
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
		addTransitionFrom: {#status -> #S}
		to: {#status -> #I}
		probability: [ :m | m atParameter: #lambda ].
	model 
		addTransitionFrom: {#status -> #I} 
		to: {#status -> #R} 
		probability: [ :m | m atParameter: #gamma ].
	model 
		addTransitionFrom: {#status -> #S}
		to: #empty 
		probability: [ :m | m atParameter: #mu ].
	model 
		addTransitionFrom: {#status -> #I} 
		to: #empty 
		probability: [ :m | m atParameter: #mu ].
	model 
		addTransitionFrom: {#status -> #R} 
		to: #empty 
		probability: [ :m | m atParameter: #mu ].
	model 
		addTransitionFrom: #empty 
		to: {#status -> #S} 
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
	db := (KEDiagramBuilder new) data: ((simulator timeSeriesOutputsAt: {#status -> #I}) sqrt).
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
	model addTransitionFrom: {#status -> #S}
		to: {#status -> #I}
		probability: [ :m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I}) / (m atParameter: #N)].
	model addTransitionFrom: {#status -> #I}
		to: {#status -> #R}
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
	model addTransitionFrom: {#status -> #S}
		to: {#status -> #I}
		probability: [ :m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I})].
	model addTransitionFrom: {#status -> #I}
		to: {#status -> #R}
		probability: [ :m| (m atParameter: #gamma)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 200 step: 0.01.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator timeSeriesOutputs.
	^ dB view
	
	
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
	db := (KEDiagramBuilder new) data: (simulator timeSeriesOutputsAt: {#status -> #I}).
	db open.
	db openMap: #africa 
	   countries: (model atAttribute: #country) 
	   coloredBy: #peakOfEpidemic
]
