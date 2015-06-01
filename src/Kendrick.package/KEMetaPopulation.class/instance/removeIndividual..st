accessing
removeIndividual: ind
	|g|
	super removeIndividual: ind.
	"graphs at: #status ifPresent: [ (graphs at: #status) releaseNode: ind ]"
	"(graphs first key = #status) ifTrue: [ graphs first value releaseNode: ind ]"
	g := graphs select: [ :e| e attribute = #status ].
	g size > 0 ifTrue: [ g fist releaseNodeOf: ind ]
	