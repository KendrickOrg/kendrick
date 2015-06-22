tests
testEvaluateProbability
	|tr model rs|
	model := KEModel new.
	tr := KETransition
			from: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :fr :to :t| (model atParameter: #beta) * fr * to ].
	model buildFromCompartments: '{
		{ #status: #S }: 10000,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameters: '{#beta: 0.0052, #gamma: 52}'.
	rs := tr probability 
			value: (model atCompartment: tr from)
			value: (model atCompartment: tr to)
			value: 0.
	self assert: rs equals: 52