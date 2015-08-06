examples
exampleRK4SolverOnMultiStrainModel
	"self new exampleRK4SolverOnMultiStrainModel"
	|model simulator db data|
	model := KEModel new.
	model population attributes: {#status->#(#S #I1 #I2 #R)}.
	model buildFromCompartments: '{
		{ #status: #S }: 9900,
		{ #status: #I1 }: 99,
		{ #status: #I2 }: 1,
		{ #status: #R }: 0
	}'.
	model addParameter: #beta1 value: 0.00002.
	model addParameter: #beta2 value: 0.00018.
	model addParameter: #gamma1 value: 0.1.
	model addParameter: #gamma2 value: 1.
	model addParameter: #mu value: 5e-5.
	
	model 
		addTransitionFrom: '{#status:#S}' 
		to: '{#status: #I1}' 
		probability: [ :m| (m atParameter: #beta1) * (m probabilityOfContact: '{#status:#I1}') ].
	model
		addTransitionFrom: '{#status:#S}' 
		to: '{#status:#I2}' 
		probability: [ :m| (m atParameter: #beta2) * (m probabilityOfContact: '{#status: #I2}') ].
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
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 150 step: 0.1.
	simulator executeOn: model.
	data := OrderedCollection new.
	data addAll: (simulator timeSeriesAt: '{#status: #I1}').
	data addAll: (simulator timeSeriesAt: '{#status: #I2}').
	db := KEDiagramBuilder new data: data.
	^ db view							
														