as yet unclassified
updateDataAt: t
	model population compartments keysAndValuesDo: [ :k :v|
		(self data at: k) add: v atIndex: t
		 ]