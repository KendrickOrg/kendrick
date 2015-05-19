tests
testNumberContacts
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model parameters at: #inProcessingCompartment put: (Dictionary newFrom: {#status->#S}).
	self assert: (model numberContacts: {#status->#I}) equals: 1.

