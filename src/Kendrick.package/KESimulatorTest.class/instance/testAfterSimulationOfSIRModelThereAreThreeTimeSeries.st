as yet unclassified
testAfterSimulationOfSIRModelThereAreThreeTimeSeries

|model simulator   |
	model := KEModel new.
	model population attributes: '{#status: [#S, #I, #R]}'.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameters: {#beta->520. #gamma->52}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I}) / (m atParameter: #N)].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (model atParameter: #gamma)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 1.0 step: 0.001.
	simulator executeOn: model.
	self assert: simulator allTimeSeries size = 3.