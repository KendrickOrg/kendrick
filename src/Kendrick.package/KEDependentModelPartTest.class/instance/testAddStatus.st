tests-as yet unclassified
testAddStatus
	|model concern sirTransitionMatrix|
	model := KEModel new population: (KEPopulation new).
	model integrate: self sirConcern.
	model integrate: self multiHostConcern.
	concern := KEModelPart dependOn: (self sirConcern).
	concern addStatus: #(E).
	concern removeTransitionFrom: { #status->#S } to: { #status->#I }.
	concern addTransitionFrom: { #status->#S } to: { #status->#E } probability: [ :aModel| aModel atParameter: #lambda ].
	concern addTransitionFrom: { #status->#E } to: { #status->#I } probability: [ :aModel| aModel atParameter: #epsilon ].
	concern addTransitionFrom: { #status->#E } to: #empty probability: [ :aModel| aModel atParameter: #mu ].
	concern addParameter: #epsilon.
	sirTransitionMatrix := concern project: model transitions.
	self assert: (concern generateSum: sirTransitionMatrix) size equals: 8 