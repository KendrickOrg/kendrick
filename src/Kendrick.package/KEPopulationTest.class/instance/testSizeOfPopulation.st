tests
testSizeOfPopulation
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	self assert: (model population sizeOfPopulation: #population) equals: 100000.

	