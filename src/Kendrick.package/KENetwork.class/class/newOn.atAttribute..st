as yet unclassified
newOn: population atAttribute: attribute
	|network|
	network := self new attribute: attribute.
	network addNodes: (population atAttribute: attribute) from: population.
	population graphs add: network.
	^ network