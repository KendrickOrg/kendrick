tests-as yet unclassified
testAtAttributeAdd
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1
		addAttribute: #status value: #(#S #I);
		atAttribute: #status add: #R.
	self assert: (tmp1 atAttribute: #status) size equals: 3