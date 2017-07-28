adding
removeIndividual: ind
	"one individual died"

	self diedIndList add: ind.
	individuals remove: ind.	
	Transcript show: (self diedIndList ) size; show: ' '; show: (self individuals size); cr.	