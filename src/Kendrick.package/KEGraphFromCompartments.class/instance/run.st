running
run
	self nodes: model initCompartments keys.
	model transitions
		do: [ :t | 
			self
				edges:
					{(t from) ->
					(t to)} 
				from: #key
				to: #value]