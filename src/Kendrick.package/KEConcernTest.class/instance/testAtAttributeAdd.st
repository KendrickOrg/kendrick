tests-as yet unclassified
testAtAttributeAdd
	|c|
	c := KEConcern new.
	c addAttribute: #status value: #(S I).
	c atAttribute: #status add: #R.
	self assert: (c atAttribute: #status) size equals: 3 