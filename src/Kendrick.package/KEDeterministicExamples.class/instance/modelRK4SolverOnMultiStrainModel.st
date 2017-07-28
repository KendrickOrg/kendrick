examples
modelRK4SolverOnMultiStrainModel
	|model|
	model := KEModel new population: (KEPopulation size: 10000).
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
		addTransitionFrom: '{#status:#S}' 
		to: '{#status: #I1}' 
		probability: [ :m| 
			(m atParameter: #beta1) * (m atCompartment: {#status->#I1}) ].
	model
		addTransitionFrom: '{#status:#S}' 
		to: '{#status:#I2}' 
		probability: [ :m| (m atParameter: #beta2) * (m atCompartment: {#status->#I2}) ].
	model
		addTransitionFrom: '{#status: #I1}' 
		to: '{#status: #R}' 
		probability: [ :m| (m atParameter: #gamma1) ].
	model
		addTransitionFrom: '{#status: #I2}' 
		to: '{#status: #R}'
		probability: [ :m| (m atParameter: #gamma2) ].
	model
		addTransitionFrom: '{#status: #S}' 
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model 
		addTransitionFrom: '{#status: #I1}' 
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model 
		addTransitionFrom: '{#status: #I2}' 
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model
		addTransitionFrom: '{#status: #R}' 
		to: #empty 
		probability: [ :m| (m atParameter: #mu) ].
	model
		addTransitionFrom: #empty 
		to: '{#status: #S}' 
		probability: [ :m| (m atParameter: #mu) ].
	^ model