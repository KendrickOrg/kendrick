tests
testAtCompartment
	|model compartment|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S, #region: #A }: 99999,
		{ #status: #I, #region: #A }: 1,
		{ #status: #R, #region: #A }: 0
	}'.
	compartment := model atCompartment: '{#region: #A}'.
	self assert: compartment isDictionary equals: true