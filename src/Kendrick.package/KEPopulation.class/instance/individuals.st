accessing
individuals
	"Return the individuals of a population"
	"If the individuals does not exist, we create them"
	individuals ifNil: [ 
		|n|
		n := 0.
		individuals := OrderedCollection new.
		self compartments keysAndValuesDo: [ :k :v|
			1 to: v do: [ :i|
				|ind|
				ind := KEIndividual new.
				n := n + 1.
				ind updateAttributes: k.
				ind currentStatus: k.
				individuals add: ind.
				 ]
			 ]
		 ].
	^ individuals
	