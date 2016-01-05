examples
exampleRK4SolverOnMultiInfectiousStatusModel
	"self new exampleRK4SolverOnMultiInfectiousStatusModel"
	|model simulator db data|
	model := KEModel new.
	model population attributes: {#status->#(S I Is R)}.
	model buildFromCompartments: '{
		{ #status: #S }: 450,
		{ #status: #I }: 10,
		{ #status: #Is }: 40,
		{ #status: #R }: 0
	}'.
	model addParameter: #beta1 value: 0.007.
	model addParameter: #beta2 value: 0.001.
	model addParameter: #delta value: 0.5.
	model addParameter: #gamma1 value: 0.5.
	model addParameter: #gamma2 value: 0.25.
	model 
		addTransitionFrom: '{#status: #S}' 
		to: '{#status: #I}' 
		probability: [ :m| 
			((m atParameter: #beta1) * 
			(m atCompartment: {#status->#I})) +
			((m atParameter: #beta2) * 
			(m atCompartment: {#status->#Is})) ].
	model
		addTransitionFrom: '{#status: #I}' 
		to: '{#status: #Is}' 
		probability: [ :m| m atParameter: #delta ].
	model 
		addTransitionFrom: '{#status: #I}' 
		to: '{#status:#R}' 
		probability: [ :m| m atParameter: #gamma1 ].
	model
		addTransitionFrom: '{#status: #Is}' 
		to: '{#status: #R}' 
		probability: [ :m| m atParameter: #gamma2 ].
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 50 step: 0.1.
	simulator executeOn: model.
	data := OrderedCollection new.
	data addAll: (simulator timeSeriesAt: '{#status:#I}').
	data addAll: (simulator timeSeriesAt: '{#status:#Is}').
	db := KEDiagramBuilder new data: data.
	^ db view
	 
															
														