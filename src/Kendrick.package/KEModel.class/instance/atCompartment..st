accessing
atCompartment: arg1
	| tmp1 tmp2 |
	arg1 isString
		ifTrue: [ tmp1 := STON fromString: arg1 ].
	arg1 isDictionary
		ifTrue: [ tmp1 := arg1 ].
	arg1 isArray
		ifTrue: [ tmp1 := Dictionary newFrom: arg1 ].
	tmp1
		at: #status
		ifPresent: [ (tmp1 at: #status) = #empty
				ifTrue: [ ^ self atParameter: #N ] ].
	tmp2 := self attributes keys
		reject: [ :arg2 | tmp1 keys includes: arg2 ].
	tmp2 isEmpty
		ifTrue: [ ^ self population sizeOfACompartment: tmp1 ].
	^ (self atAttribute: tmp2 first)
		collect: [ :arg3 | 
			| tmp3 |
			tmp3 := tmp1 copy.
			tmp3 at: tmp2 first put: arg3.
			self population sizeOfACompartment: tmp3 ]