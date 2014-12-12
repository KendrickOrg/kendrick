running
run
	self nodes: model population compartments.
	model transitions
		do: [ :t | 
			self
				edges:
					{(t from).
					(t to)}
				from: #first
				to: #second ]