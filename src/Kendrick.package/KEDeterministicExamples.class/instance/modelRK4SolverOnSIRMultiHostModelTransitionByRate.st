examples
modelRK4SolverOnSIRMultiHostModelTransitionByRate
	"self new exampleRK4SolverOnSIRMultiHostModelTransitionByRate"

	| model  multiHostConcern|
	multiHostConcern := KEConcern new.
	multiHostConcern 
		addAttribute: #species 
		value: #(#mosquito #reservoir1 #reservoir2).
	model := KEModel new.
	model population: (KEPopulation size: 13000).
	model attributes: {(#status -> #(#S #I #R))}.
	model addParameter: #mu value: 12.17.
	model addParameter: #gamma value: 52.
	model addParameter: #beta value: 1.
	model addParameter: #lambda value: [ :aModel| 
		(aModel atParameter: #beta) * 
		(aModel atCompartment: {#status->#I}) ].
	model 
		addTransitionFrom: '{#status: #S}' 
		to: '{#status: #I}' 
		probability: 'lambda' parseAsAnExpression.
	model 
		addTransitionFrom: '{#status: #I}' 
		to: '{#status: #R}' 
		probability: 'gamma' parseAsAnExpression.
	model 
		addTransitionFrom: '{#status: #S}' 
		to: #empty 
		probability: 'mu' parseAsAnExpression.
	model 
		addTransitionFrom: '{#status: #I}' 
		to: #empty 
		probability: 'mu' parseAsAnExpression.
	model 
		addTransitionFrom: '{#status: #R}' 
		to: #empty 
		probability: 'mu' parseAsAnExpression.
	model 
		addTransitionFrom: #empty 
		to: '{#status: #S}' 
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