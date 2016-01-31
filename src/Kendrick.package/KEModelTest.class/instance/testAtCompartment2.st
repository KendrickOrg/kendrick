tests
testAtCompartment2
	|model |
	model := KEModel new.
	model addAttribute: #status value: #(S I R).
	model addAttribute: #region value: #(A B C).  
	model buildFromCompartments: '{
		{ #status: #S, #region: #A }: 99999,
		{ #status: #I, #region: #A }: 1,
		{ #status: #R, #region: #A }: 0
	}'.
	self assert: (model atCompartment: {#region->#A. #status->#S}) equals: 99999.
	self assert: (model atCompartment: {#region->#A}) equals: #(99999 1 0).