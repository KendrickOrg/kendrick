running
run
	self nodes: model population compartments.
	model transitions
		do: [ :t | 
			self
				edges:
					{(t from associations) ->
					(t to associations)} 
				from: #key
				to: #value ]