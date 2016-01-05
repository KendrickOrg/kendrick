tests-as yet unclassified
testAttributes
	|c|
	c := KEConcern new.
	c attributes: { #species->#(s1 s2 s3) }.
	self assert: c attributes size equals: 1