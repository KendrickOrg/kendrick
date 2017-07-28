running
run
	self nodes: model initCompartments keys.
			self
				edges: (model transitions collect: [ :t | 
					{(t from) .
					(t to) . t probability}]) 
				from: #first
				to: #second
				weight: #third