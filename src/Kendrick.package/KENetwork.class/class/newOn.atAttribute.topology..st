as yet unclassified
newOn: model atAttribute: attribute topology: topology
	|network|
	network := self new attribute: attribute.
	network addNodes: (model atAttribute: attribute) from: model population.
	network topology: topology.
	model population graphs add: network.
	^ network