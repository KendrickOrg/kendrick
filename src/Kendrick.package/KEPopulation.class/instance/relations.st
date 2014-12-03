accessing
relations
	relations ifNil: [ relations := self attributes keys ].
	^ relations
	