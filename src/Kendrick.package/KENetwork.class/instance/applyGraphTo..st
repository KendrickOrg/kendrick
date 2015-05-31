as yet unclassified
applyGraphTo: model
	self networkOfIndividuals ifTrue: [ 
		|networkAdapter|
		networkAdapter := KENetworkAdapter new.
		networkAdapter atArgument: #graph put: self.
		networkAdapter adaptTo: model
		 ]
	