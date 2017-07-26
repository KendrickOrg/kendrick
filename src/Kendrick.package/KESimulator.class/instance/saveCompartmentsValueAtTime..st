as yet unclassified
saveCompartmentsValueAtTime: t
	model population compartments
		keysAndValuesDo: [ :k :v | 
			| ts |
			ts := timeSeries detect: [ :e | e compartment = k ].
			ts add: v atIndex: t ]