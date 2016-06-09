tests-as yet unclassified
testRemoveTransitionFromTo
	|model concern sirTransitionMatrix|
	model := KEModel new population: (KEPopulation new).
	model integrate: self sirConcern.
	model integrate: self multiHostConcern.
	concern := KEConcern dependOn: (self sirConcern).
	concern atAttribute: #status add: #E.
	concern removeTransitionFrom: { #status->#S } to: { #status->#I }.
	concern addTransitionFrom: { #status->#S } to: { #status->#E } probability: [ :aModel| aModel atParameter: #lambda ].
	concern addTransitionFrom: { #status->#E } to: { #status->#I } probability: [ :aModel| aModel atParameter: #epsilon ].
	concern addTransitionFrom: { #status->#E } to: #empty probability: [ :aModel| aModel atParameter: #mu ].
	concern addParameter: #epsilon.
	sirTransitionMatrix := concern project: model transitions.
	self assert: (concern generateSum: sirTransitionMatrix) size equals: 8 