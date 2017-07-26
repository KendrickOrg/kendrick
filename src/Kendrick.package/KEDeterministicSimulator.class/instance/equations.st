accessing
equations
	equations := Dictionary new.
	model compartmentNames do: [ :k| equations at: k put: OrderedCollection new ].
	model transitions do: [ :tr|
		(tr from at: #status) = #empty ifTrue:
			[ (equations at: tr to) add: (Array with: tr with: 1) ].
		(tr to at: #status) = #empty ifTrue:
			[ (equations at: tr from) add: (Array with: tr with: -1) ].
		(((tr from at: #status) ~= #empty) and: [ (tr to at: #status) ~= #empty ]) ifTrue:[ 
			(equations at: tr from) add: (Array with: tr with: -1).
			(equations at: tr to) add: (Array with: tr with: 1) ]
		 ].
	^ equations