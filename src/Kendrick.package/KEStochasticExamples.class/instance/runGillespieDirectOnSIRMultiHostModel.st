examples
runGillespieDirectOnSIRMultiHostModel
	"self new runGillespieDirectOnSIRMultiHostModel"
	|model simulator output db|
	model := KEModel new.
	model population attributes: '{
		#status: [ #S, #I, #R ], #specie: [ #mosquito, #reservoir1, #reservoir2 ]
	}'.
	model buildFromCompartments: '{
		{ #status: #S, #specie: #mosquito }: 9999,
		{ #status: #I, #specie: #mosquito }: 1,
		{ #status: #R, #specie: #mosquito }: 0,
		{ #status: #S, #specie: #reservoir1 }: 999,
		{ #status: #I, #specie: #reservoir1 }: 1,
		{ #status: #R, #specie: #reservoir1 }: 0,
		{ #status: #S, #specie: #reservoir2 }: 1999,
		{ #status: #I, #specie: #reservoir2 }: 1,
		{ #status: #R, #specie: #reservoir2 }: 0
	}'.
	model addParameter: '{{#specie: #mosquito}:{
		#beta: { { #specie: #reservoir1 }: 0.02, { #specie: #reservoir2 }: 0.02, #yourself: 0.0 },
		#mu: 12.17,
		#N: 10000
		}
	}'.
	model addParameter: '{{#specie: #reservoir1}:{
		#beta: { { #specie: #reservoir2 }: 0.0, { #specie: #mosquito }: 0.02, #yourself: 0.0 },
		#mu: 0.05,
		#N: 1000
		}
	}'.
	model addParameter: '{{#specie: #reservoir2}:{
		#beta: { { #specie: #reservoir1 }: 0.0, { #specie: #mosquito }: 0.02, #yourself: 0.0 },
		#mu: 0.05,
		#N: 2000
		}
	}'.
	model addParameter: '{#gamma: 52}'.
		model addTransition: (KETransition
			from: '{#specie: #mosquito, #status: #S}'
			to: '{#specie: #mosquito, #status: #I}'
			probability: [:m| 
				(m atParameter: '{{#specie:#mosquito}:#beta}')*(m atCompartment: '{#status: #I}')]).
		model addTransition: (KETransition
			from: '{#specie: #mosquito, #status: #I}'
			to: '{#specie: #mosquito, #status: #R}'
			probability: [:m| (m atParameter: #gamma)]).
		model addTransition: (KETransition
			from: '{#specie: #mosquito, #status: #S}'
			to: #empty
			probability: [:m| (m atParameter: '{{#specie:#mosquito}:#mu}')]).
		model addTransition: (KETransition
			from: '{#specie: #mosquito, #status: #I}'
			to: #empty
			probability: [:m| (m atParameter: '{{#specie:#mosquito}:#mu}')]).
		model addTransition: (KETransition
			from: '{#specie: #mosquito, #status: #R}'
			to: #empty
			probability: [:m| (m atParameter: '{{#specie:#mosquito}:#mu}')]).
		model addTransition: (KETransition
			from: #empty
			to: '{#specie: #mosquito, #status: #S}'
			probability: [:m| 
				(m atParameter: '{{#specie:#mosquito}:#mu}')*(m atParameter: '{{#specie:#mosquito}:#N}')]).
	
	model addTransition: (KETransition
			from: '{#specie: #reservoir1, #status: #S}'
			to: '{#specie: #reservoir1, #status: #I}'
			probability: [:m| 
				(m atParameter: '{{#specie:#reservoir1}:#beta}')*(m atCompartment: '{#status: #I}')]).
		model addTransition: (KETransition
			from: '{#specie: #reservoir1, #status: #I}'
			to: '{#specie: #reservoir1, #status: #R}'
			probability: [:m| (m atParameter: #gamma)]).
		model addTransition: (KETransition
			from: '{#specie: #reservoir1, #status: #S}'
			to: #empty
			probability: [:m| (m atParameter: '{{#specie:#reservoir1}:#mu}')]).
		model addTransition: (KETransition
			from: '{#specie: #reservoir1, #status: #I}'
			to: #empty
			probability: [:m| (m atParameter: '{{#specie:#reservoir1}:#mu}')]).
		model addTransition: (KETransition
			from: '{#specie: #reservoir1, #status: #R}'
			to: #empty
			probability: [:m| (m atParameter: '{{#specie:#reservoir1}:#mu}')]).
		model addTransition: (KETransition
			from: #empty
			to: '{#specie: #reservoir1, #status: #S}'
			probability: [:m| 
				(m atParameter: '{{#specie:#reservoir1}:#mu}')*(m atParameter: '{{#specie:#reservoir1}:#N}')]).
			
	model addTransition: (KETransition
			from: '{#specie: #reservoir2, #status: #S}'
			to: '{#specie: #reservoir2, #status: #I}'
			probability: [:m| 
				(m atParameter: '{{#specie:#reservoir2}:#beta}')*(m atCompartment: '{#status: #I}')]).
		model addTransition: (KETransition
			from: '{#specie: #reservoir2, #status: #I}'
			to: '{#specie: #reservoir2, #status: #R}'
			probability: [:m| (m atParameter: #gamma)]).
		model addTransition: (KETransition
			from: '{#specie: #reservoir2, #status: #S}'
			to: #empty
			probability: [:m| (m atParameter: '{{#specie:#reservoir2}:#mu}')]).
		model addTransition: (KETransition
			from: '{#specie: #reservoir2, #status: #I}'
			to: #empty
			probability: [:m| (m atParameter: '{{#specie:#reservoir2}:#mu}')]).
		model addTransition: (KETransition
			from: '{#specie: #reservoir2, #status: #R}'
			to: #empty
			probability: [:m| (m atParameter: '{{#specie:#reservoir2}:#mu}')]).
		model addTransition: (KETransition
			from: #empty
			to: '{#specie: #reservoir2, #status: #S}'
			probability: [:m| 
				(m atParameter: '{{#specie:#reservoir2}:#mu}')*(m atParameter: '{{#specie:#reservoir2}:#N}')]).
			
	simulator := KESimulator new: #Gillespie from: 0.0 to: 1.0 step: 0.001.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	db open
	