as yet unclassified
applyGraph: model
	self networkOfIndividuals ifTrue: [ 
		|networkAdapter|
		networkAdapter := KENetworkAdapter new.
		networkAdapter atArgument: #graph put: self.
		networkAdapter adaptTo: model
		 ].
	self graphs do: [ :g| g applyGraph: model ]
	