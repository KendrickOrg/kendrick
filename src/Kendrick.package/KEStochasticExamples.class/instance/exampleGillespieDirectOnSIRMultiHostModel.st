examples
exampleGillespieDirectOnSIRMultiHostModel
	"self new exampleGillespieDirectOnSIRMultiHostModel"
	|model simulator output db|
	model := KEModel new.
	model population attributes: '{
		#status: [ #S, #I, #R ], #species: [ #mosquito, #reservoir1, #reservoir2 ]
	}'.
	model buildFromCompartments: '{
		{ #status: #S, #species: #mosquito }: 9800,
		{ #status: #I, #species: #mosquito }: 200,
		{ #status: #R, #species: #mosquito }: 0,
		{ #status: #S, #species: #reservoir1 }: 1000,
		{ #status: #I, #species: #reservoir1 }: 0,
		{ #status: #R, #species: #reservoir1 }: 0,
		{ #status: #S, #species: #reservoir2 }: 2000,
		{ #status: #I, #species: #reservoir2 }: 0,
		{ #status: #R, #species: #reservoir2 }: 0
	}'.
	model addParameters: '{{#species: #mosquito}:{
		#beta: { { #species: #reservoir1 }: 0.02, { #species: #reservoir2 }: 0.02, #yourself: 0.0 },
		#mu: 12.17
		}
	}'.
	model addParameters: '{{#species: #reservoir1}:{
		#beta: { { #species: #reservoir2 }: 0.0, { #species: #mosquito }: 0.02, #yourself: 0.0 },
		#mu: 0.05
		}
	}'.
	model addParameters: '{{#species: #reservoir2}:{
		#beta: { { #species: #reservoir1 }: 0.0, { #species: #mosquito }: 0.02, #yourself: 0.0 },
		#mu: 0.05
		}
	}'.
	model addParameters: '{#gamma: 52, #N: #sizeOfPopulation}'.
	model addTransitionFrom: '{#species: #mosquito, #status: #S}'
			to: '{#species: #mosquito, #status: #I}'
			probability: [:m| 
				(m atParameter: '{{#species:#mosquito}:#beta}')*(m atCompartment: '{#status: #I}')].
	model addTransitionFrom: '{#species: #mosquito, #status: #I}'
			to: '{#species: #mosquito, #status: #R}'
			probability: [:m| (m atParameter: #gamma)].
	model addTransitionFrom: '{#species: #mosquito, #status: #S}'
			to: #empty
			probability: [:m| (m atParameter: '{{#species:#mosquito}:#mu}')].
	model addTransitionFrom: '{#species: #mosquito, #status: #I}'
			to: #empty
			probability: [:m| (m atParameter: '{{#species:#mosquito}:#mu}')].
	model addTransitionFrom: '{#species: #mosquito, #status: #R}'
			to: #empty
			probability: [:m| (m atParameter: '{{#species:#mosquito}:#mu}')].
	model addTransitionFrom: #empty
			to: '{#species: #mosquito, #status: #S}'
			probability: [:m| 
				(m atParameter: '{{#species:#mosquito}:#mu}')].
	model addTransitionFrom: '{#species: #reservoir1, #status: #S}'
			to: '{#species: #reservoir1, #status: #I}'
			probability: [:m| 
				(m atParameter: '{{#species:#reservoir1}:#beta}')*(m atCompartment: '{#status: #I}')].
	model addTransitionFrom: '{#species: #reservoir1, #status: #I}'
			to: '{#species: #reservoir1, #status: #R}'
			probability: [:m| (m atParameter: #gamma)].
	model addTransitionFrom: '{#species: #reservoir1, #status: #S}'
			to: #empty
			probability: [:m| (m atParameter: '{{#species:#reservoir1}:#mu}')].
	model addTransitionFrom: '{#species: #reservoir1, #status: #I}'
			to: #empty
			probability: [:m| (m atParameter: '{{#species:#reservoir1}:#mu}')].
	model addTransitionFrom: '{#species: #reservoir1, #status: #R}'
			to: #empty
			probability: [:m| (m atParameter: '{{#species:#reservoir1}:#mu}')].
	model addTransitionFrom: #empty
			to: '{#species: #reservoir1, #status: #S}'
			probability: [:m| 
				(m atParameter: '{{#species:#reservoir1}:#mu}')].
	model addTransitionFrom: '{#species: #reservoir2, #status: #S}'
			to: '{#species: #reservoir2, #status: #I}'
			probability: [:m| 
				(m atParameter: '{{#species:#reservoir2}:#beta}')*(m atCompartment: '{#status: #I}')].
	model addTransitionFrom: '{#species: #reservoir2, #status: #I}'
			to: '{#species: #reservoir2, #status: #R}'
			probability: [:m| (m atParameter: #gamma)].
	model addTransitionFrom: '{#species: #reservoir2, #status: #S}'
			to: #empty
			probability: [:m| (m atParameter: '{{#species:#reservoir2}:#mu}')].
	model addTransitionFrom: '{#species: #reservoir2, #status: #I}'
			to: #empty
			probability: [:m| (m atParameter: '{{#species:#reservoir2}:#mu}')].
	model addTransitionFrom: '{#species: #reservoir2, #status: #R}'
			to: #empty
			probability: [:m| (m atParameter: '{{#species:#reservoir2}:#mu}')].
	model addTransitionFrom: #empty
			to: '{#species: #reservoir2, #status: #S}'
			probability: [:m| 
				(m atParameter: '{{#species:#reservoir2}:#mu}')].
			
	simulator := KESimulator new: #Gillespie from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	db xLabel: 'Time (year)'.
	db yLabel: 'sqrt(Infectious)'.
	db open
	