as yet unclassified
testExecuteTransition
	|tr model |
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
	tr executeOn: model times: 1.
	self assert: (model atCompartment: '{#status:#S}') equals: 9999.
	self assert: (model atCompartment: '{#status:#I}') equals: 2.  