adding
buildEquations
	| tmp1 |
	tmp1 := Dictionary new.
	self compartmentNames
		do: [ :arg1 | tmp1 at: arg1 put: OrderedCollection new ].
	self transitions
		do: [ :arg2 | 
			(arg2 from at: #status) = #empty
				ifTrue: [ (tmp1 at: arg2 to) add: (Array with: arg2 with: 1) ].
			(arg2 to at: #status) = #empty
				ifTrue: [ (tmp1 at: arg2 from) add: (Array with: arg2 with: -1) ].
			((arg2 from at: #status) ~= #empty
				and: [ (arg2 to at: #status) ~= #empty ])
				ifTrue: [ (tmp1 at: arg2 from) add: (Array with: arg2 with: -1).
					(tmp1 at: arg2 to) add: (Array with: arg2 with: 1) ] ].
	^ tmp1