as yet unclassified
saveCompartmentsValueAtTime: t
self halt.
	model population compartments
		keysAndValuesDo: [ :k :v | 
			| ts |
			ts := timeSeriesOutputs detect: [ :e | e compartment = k ].
			ts add: v atIndex: t ]