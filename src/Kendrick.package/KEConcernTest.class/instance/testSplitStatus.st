tests-as yet unclassified
testSplitStatus
	|twoStrains|
	twoStrains := KEConcern extends: self sirConcern.
	twoStrains splitStatus: { #(I). #strains->#(1 2) }.

	self assert: (twoStrains atAttribute: #status) size equals: 5.
	self assert: (twoStrains transitions size) equals: 12