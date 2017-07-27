adding
removeIndividual: arg1
	arg1 attributes at: #alive put: false.
	self diedIndList add: arg1 id.
	self individuals at: arg1 id put: arg1