tests-as yet unclassified
testAddTransitionFromToProbability
	|c|
	c := KEModelPart new.
	c addTransitionFrom: { #status->#I } to: { #status->#R } probability: 0.5.
	self assert: c transitions size equals: 1