tests-as yet unclassified
testRemoveTransitionFromTo
	|c|
	c := KEConcern new.
	c addTransitionFrom: { #status->#I } to: { #status->#R } probability: 0.5.
	self assert: c transitions size equals: 1.
	c removeTransitionFrom: { #status->#I } to: { #status->#R }.
	self assert: c transitions size equals: 1.
	self assert: c transitions first probability equals: 0
	