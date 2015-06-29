running
run
	self nodes: model population compartments keys.
	model transitions
		do: [ :t | 
			self
				edges:
					{(t from) ->
					(t to)} 
				from: #key
				to: #value]