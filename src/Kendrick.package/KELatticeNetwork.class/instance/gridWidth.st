as yet unclassified
gridWidth
	gridWidth ifNil: [ gridWidth := (self nodes size) sqrt rounded ].
	^ gridWidth