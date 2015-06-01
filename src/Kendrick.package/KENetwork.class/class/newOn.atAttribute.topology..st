as yet unclassified
newOn: population atAttribute: attribute topology: topology
	|network|
	network := self new attribute: attribute.
	network addNodes: (population atAttribute: attribute) from: population.
	network topology: topology.
	population graphs add: network.
	^ network