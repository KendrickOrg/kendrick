accessing
processLevel: level sourceNode: source destinationNode: destination
	|g n rs|
	(level > graphs size) ifTrue: [
		^ super probabilityOfContactsOf: source with: destination
	].
	g := graphs at: level.
	g attribute = #status 
	ifTrue: [ n := g atNode: (source at: #id) ]
	ifFalse: [ n := g atNode: (source at: g attribute) ].
	rs := 0.
	n adjacentNodes keysAndValuesDo: [ :k :v| 
		|tmp s|
		g attribute = #status 
		ifTrue: [ (k includesAll: destination) ifTrue: [tmp := 1] ifFalse: [ tmp := 0 ] ]
		ifFalse: [ 
			s := source copy.
			s at: (g attribute) put: ((Dictionary newFrom: k) at: g attribute).
			tmp := self processLevel: (level + 1) sourceNode: s destinationNode: destination.
			].
		rs := rs + ((g strengthFormula value: v) * tmp)
	].
	^ rs
	