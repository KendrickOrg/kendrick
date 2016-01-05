tests-as yet unclassified
testSizeOfPopulation
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	
	self assert: (model sizeOfPopulation) equals: 100000.
	self assert: (model sizeOfPopulation: #(#S)) equals: 99999.
	self assert: (model sizeOfPopulation: #(#I)) equals: 1.
	self assert: (model sizeOfPopulation: #(#R)) equals: 0.