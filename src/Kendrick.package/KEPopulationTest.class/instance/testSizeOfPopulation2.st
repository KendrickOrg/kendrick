tests
testSizeOfPopulation2
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S, #region: #A }: 99999,
		{ #status: #I, #region: #A }: 1,
		{ #status: #R, #region: #A }: 0
	}'.
	model configurations: '{#sizeOfPopulation: [#region]}'.

	self assert: (model population sizeOfPopulation: (Dictionary newFrom: {#region->#A. #status->#S})) equals: 100000