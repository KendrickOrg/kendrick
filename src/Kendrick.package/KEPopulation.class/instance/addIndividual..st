adding
addIndividual: arg1
	self diedIndList isEmpty
		ifTrue: [ arg1 id: self individuals size + 1.
			self individuals add: arg1 ]
		ifFalse: [ arg1 id: self diedIndList removeFirst.
			self individuals at: arg1 id put: arg1 ]