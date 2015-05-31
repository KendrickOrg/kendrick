tests
testSizeOfPopulation
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	self assert: (model sizeOfPopulation: #population) equals: 100000.

	model buildFromCompartments: '{
		{ #status: #S, #region: #A }: 99999,
		{ #status: #I, #region: #A }: 1,
		{ #status: #R, #region: #A }: 0
	}'.
	self assert: (model sizeOfPopulation: {#region->#A}) equals: 100000