as yet unclassified
testEvaluateProbability
	|tr model rs|
	tr := KETransition
			from: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :f :t :m| (m atParameter: #beta) * f * t ].
	model := KEModel new.
	model oldVersion: false.
	model buildFromCompartments: '{
		{ #status: #S }: 10000,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameter: '{#beta: 0.0052, #gamma: 52}'.
	rs := tr probability 
			value: (model atCompartment: tr from)
			value: (model atCompartment: tr to)
			value: model.
	self assert: rs equals: 52