tests
testBuildFromAttributesCompartments
	|model|
	model := KEModel new.
	model buildFromAttributes: #status compartments: { #S->999. #I->1. #R->0 }.
	self assert: (model compartments isDictionary) equals: true