as yet unclassified
newOn: model atAttribute: attribute
	|network|
	network := self new attribute: attribute.
	network addNodes: (model atAttribute: attribute) from: model population.
	model population graphs add: network.
	^ network