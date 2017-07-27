public-api
compartmentNames
	| tmp1 tmp2 |
	tmp1 := OrderedCollection new.
	self attributes
		keysDo: [ :arg1 | tmp1 add: ((self atAttribute: arg1) collect: [ :arg2 | arg1 -> arg2 ]) ].
	tmp2 := self crossProduct: tmp1.
	tmp2 = #(#())
		ifTrue: [ tmp2 := #() ].
	^ tmp2 collect: [ :arg3 | Dictionary newFrom: arg3 ]