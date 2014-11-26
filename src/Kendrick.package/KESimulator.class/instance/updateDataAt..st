as yet unclassified
updateDataAt: t
	model compartments keysAndValuesDo: [ :k :v|
		(self data at: k) add: v atIndex: t
		 ]