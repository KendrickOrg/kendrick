as yet unclassified
createNodeOf: ind
	"This function is just called in the case of network of individuals"
	(ind id > self nodes size) ifTrue: [ 
		self addNode: { #status->(ind currentStatus at: #status). #id->(ind id) }	].
	topology appendNode: ({#status->(ind currentStatus at: #status). #id->(ind id) })->(ind id)