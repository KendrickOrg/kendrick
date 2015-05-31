tests
testAddParameterInScopesValues
	|model |
	model := KEModel new.
	model population attributes: { #status->#(#S #I #R). #species->#(mosquito reservoir1 reservoir2) }.
	model addParameter: #mu inScopes: (#species->#(#mosquito #reservoir1 #reservoir2)) values: {365/7. 1/20. 1/20}. 
	model addParameter: #gamma inScopes: (#species->#all)  values: 0.01.
	model addParameter: #beta inScopes: (#species->#(mosquito #others)) values: #(0.02 0.01).
	self assert: (model atParameter: '{#species: #mosquito}') isDictionary equals: true.
	self assert: (model atParameter: '{{#species: #mosquito}:#mu}') equals: 365/7.
	self assert: (model atParameter: '{{#species: #mosquito}:#gamma}') equals: 0.01.
	self assert: (model atParameter: '{{#species: #mosquito}:#beta}') equals: 0.02.
	self assert: (model atParameter: '{{#species: #reservoir1}:#beta}') equals: 0.01.
	