as yet unclassified
updateDataAt: t
	model population compartments keysAndValuesDo: [ :k :v|
		(data at: k) add: v atIndex: t
		 ]