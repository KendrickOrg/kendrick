tests-as yet unclassified
testUpdateTransitionFromToProbability
	|model concern sirTransitionMatrix|
	model := KEModel new population: (KEPopulation new).
	model integrate: self sirConcern.
	model integrate: self multiHostConcern.
	concern := KEConcern dependOn: (self sirConcern).
	concern atAttribute: #status add: #Q.
	concern updateTransitionFrom: { #status->#S } to: { #status->#I } probability: [:aModel| aModel atParameter: #lambda].
	concern addTransitionFrom: { #status->#I } to: { #status->#Q } probability: [ :aModel| aModel atParameter: #nu ].
	concern addTransitionFrom: { #status->#Q } to: { #status->#R } probability: [ :aModel| aModel atParameter: #epsilon ].
	concern addTransitionFrom: { #status->#Q } to: #empty probability: [ :aModel| aModel atParameter: #mu ].
	concern addParameters: #(#epsilon #nu #lambda).
	sirTransitionMatrix := concern project: model transitions.
	self halt.
	self assert: (concern generateSum: sirTransitionMatrix) size equals: 9