tests-as yet unclassified
testAttributes
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1 attributes: {(#species -> #(#s1 #s2 #s3))}.
	self assert: tmp1 attributes size equals: 1