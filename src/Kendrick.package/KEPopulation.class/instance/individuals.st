accessing
individuals
	individuals ifNil: [ 
		|n|
		n := 0.
		self compartments keysAndValuesDo: [ :k :v|
			1 to: v do: [ :i|
				|ind|
				ind := KEIndividual new.
				n := n + 1.
				k associationsDo: [ :a| ind attributes at: a key put: a value ].
				ind id: n.
				individuals add: ind
				 ]
			 ]
		 ].
	^ individuals
	