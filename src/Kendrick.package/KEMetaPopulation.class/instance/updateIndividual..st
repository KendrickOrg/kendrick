accessing
updateIndividual: ind
	|g|
	"graphs at: #status ifPresent: [ (graphs at: #status) updateNode: ind ]."
	"(graphs first key = #status) ifTrue: [ graphs first value updateNode: ind ]."
	g := graphs select: [ :e| e attribute = #status ].
	g size > 0 ifTrue: [ g first updateNodeOf: ind ].
	super updateIndividual: ind.