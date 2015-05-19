tests
testBuildFromCompartments2
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S, #region: #A }: 99999,
		{ #status: #I, #region: #A }: 1,
		{ #status: #R, #region: #A }: 0
	}'.
	self assert: (model population compartments isDictionary) equals: true