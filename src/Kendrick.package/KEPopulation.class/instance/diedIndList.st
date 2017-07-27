accessing
diedIndList
	diedIndList ifNil: [ diedIndList := OrderedCollection new ].
	^ diedIndList