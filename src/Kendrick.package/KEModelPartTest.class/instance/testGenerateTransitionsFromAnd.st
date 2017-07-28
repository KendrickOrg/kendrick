tests-as yet unclassified
testGenerateTransitionsFromAnd
	|t keys concern|
	t := KETransition from: { #status->#S } to: { #status->#I } probability: [ :aModel| aModel atCompartment: { #status->#I } ].
	keys := { Dictionary newFrom: { #species->#mosquito }. Dictionary newFrom: { #species->#reservoir1 }. Dictionary newFrom: { #species->#reservoir2 } }.
	concern := KEModelPart new.
	self assert: (concern generateTransitionsFrom: t and: keys) size equals: 3