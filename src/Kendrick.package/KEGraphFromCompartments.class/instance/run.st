running
run
	self
		nodes: model initCompartments keys;
		edges:
			(model transitions
					collect: [ :arg1 | 
						{arg1 from.
						arg1 to.
						arg1 probability} ])
			from: #first
			to: #second
			weight: #third