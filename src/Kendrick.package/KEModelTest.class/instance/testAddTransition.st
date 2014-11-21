tests
testAddTransition
	|model |
	model := KEModel new.
	model addTransition: 
		(KETransition 
			from: '{#status: #S}' 
			to: '{#status: #I}' 
			probability: [:f :t :m| (m atParameter: #beta) * f * t]).
	self assert: (model transitions first) from isDictionary equals: true 