as yet unclassified
before

		
	| model SEIRSConcern twoStrains multiHostConcern spatialConcern simulator dB f|
	
	model := KEModel new.
	model population: (KEPopulation size: 27500).
	SEIRSConcern := KEModelPart new.
	SEIRSConcern addAttribute: #status value: #(S E I R).
	SEIRSConcern addParameters: { #beta. #gamma. #mu. #sigma. #nu }.
	SEIRSConcern addParameter: #lambda value: 'beta*I/N'.
	SEIRSConcern
		addTransitionFrom: '{#status: #S}'
		to: '{#status: #E}'
		probability: [ :aModel | 
			(aModel atParameter: #lambda) ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #E}' 
		to: '{#status: #I}' 
		probability: [ :aModel | aModel atParameter: #sigma ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #I}' 
		to: '{#status: #R}' 
		probability: [ :aModel | aModel atParameter: #gamma ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #R}' 
		to: '{#status: #S}' 
		probability: [ :aModel | aModel atParameter: #nu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #S}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #I}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #R}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #E}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: #empty 
		to: '{#status: #S}' 
		probability: [ :aModel | aModel atParameter: #mu ].
	
	twoStrains := KEModelPart dependOn: SEIRSConcern.
	twoStrains transitions: (SEIRSConcern transitions 
		select: [:tr| ((tr from at: #status) = #I) | ((tr to at: #status) = #I) ]).
	twoStrains splitStatus: {  #(I). #index->#(1 2) }.
	twoStrains addParameters: { #beta1. #beta2 }.
	
	multiHostConcern := KEModelPart new.
	multiHostConcern addAttribute: #species value: #(#human #bird).
	
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
	
	model integrate: SEIRSConcern.
	model integrate: twoStrains.
	model integrate: spatialConcern.
	model integrate: multiHostConcern.
	
	
	
	model addParameter: #beta1 value: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := #(0 0.21) ].
		c = #bird ifTrue: [ val := #(0 0.42) ].
		val
	].
	model addParameter: #beta2 value: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := #(0 0.021) ].
		c = #bird ifTrue: [ val := #(0 0.042) ].
		val
	].
	model atParameter: #lambda assignValue: [ :aModel| |c|
		c := aModel currentCompartment at: #patch.
		(((aModel atParameter: #beta1) *
		(aModel atCompartment: {#status->#I1. #patch->c})/(aModel atParameter: #N))
		+ ((aModel atParameter: #beta2) *
		(aModel atCompartment: {#status->#I2. #patch->c})/(aModel atParameter: #N))) sum.
	].
	model atParameter: #gamma assignValue: [ :aModel| |c1 c2 val| 
		c1 := aModel currentCompartment at: #species.
		c2 := aModel currentCompartment at: #status.
		(c1 = #human & c2 = #I1)  ifTrue: [ val := 0.25 ].
		(c1 = #human & c2 = #I2)  ifTrue: [ val := 0.0025 ].
		(c1 = #bird & c2 = #I1)  ifTrue: [ val := 0.233 ].
		(c1 = #bird & c2 = #I2)  ifTrue: [ val := 0.0023 ].
		val ].
	model atParameter: #sigma assignValue: [ :aModel| |c1 c2 val| 
		c1 := aModel currentCompartment at: #species.
		c2 := aModel nextCompartment at: #status.
		(c1 = #human & c2 = #I1)  ifTrue: [ val := 0.5 ].
		(c1 = #human & c2 = #I2)  ifTrue: [ val := 0.005 ].
		(c1 = #bird & c2 = #I1)  ifTrue: [ val := 0.67 ].
		(c1 = #bird & c2 = #I2)  ifTrue: [ val := 0.0067 ].
		val ].
	model atParameter: #mu assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.000365 ].
		c = #bird ifTrue: [ val := 0.00137 ].
		val ].
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := OrderedCollection new.
		c add: (aModel currentCompartment at: #patch).
		c add: (aModel currentCompartment at: #species).
		aModel sizeOfPopulation: (c asArray)
	].
	model atParameter: #nu assignValue: 0.00274.
	model atParameter: #rho assignValue: [ :aModel| |c val|
		c := aModel currentCompartment at: #species.
		c = #bird ifTrue: [ val := 0.1 ].
		c = #human ifTrue: [ val := 0.03 ].
		val
	].
	
	model 
		atCompartment: { #status->#S. #species->#bird. #patch->1 } 
		put: 4990
		atOthersPut: 0.
	model 
		atCompartment: { #status->#I1. #species->#bird. #patch->1 } 
		put: 9.
	model 
		atCompartment: { #status->#I2. #species->#bird. #patch->1 } 
		put: 1.
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
	
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 500 step: 1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	f := [:name| |d tmp|
		tmp := (simulator allTimesSeriesContaining: name) collect: [ :e| e value ].
		d := OrderedCollection new.
		1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
		(KETimeSeries from: d withIndex: tmp first index) compartment: (STON fromString: name)
		].
	dB data: { 
		(f value: '{#status:#I1,#species:#bird}'). 
		(f value: '{#status:#I1,#species: #human}').
		(f value: '{#status:#I2,#species:#bird}'). 
		(f value: '{#status:#I2,#species: #human}') }.

	dB xLabel: 'Time (days)'.
	dB legendTitle: 'Total of infectious'.
	dB legends: { 'birds strains 1'. 'humans strains 1'. 'birds strains 2'. 'humans strains 2' }.
	dB open.
	
	^ {simulator . model . dB}