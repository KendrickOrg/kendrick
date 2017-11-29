examples
mosquitoModel
	"self new mosquitoScriptForValidation"
	| model multiHostConcern |
	
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
	model atCompartment: { #status->#S. #species->#mosquito } put: 9990.
	model atCompartment: { #status->#I. #species->#mosquito } put: 10.
	model atCompartment: { #status->#S. #species->#reservoir1 } put: 1000.
	model atCompartment: { #status->#S. #species->#reservoir2 } put: 2000.

	^ model
	