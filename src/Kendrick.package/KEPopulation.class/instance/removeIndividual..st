adding
removeIndividual: ind
	"one individual died"

	ind attributes at: #alive put: false.
	self diedIndList add: ind