as yet unclassified
equations
	equations := Dictionary new.
	model compartments keys do: [ :k|
		|eq|
		eq := OrderedCollection new.
		equations at: k put: eq
		 ].
	model transitions do: [ :tr|
		tr from = #empty ifTrue:
			[ (equations at: tr to) add: (Array with: tr with: 1) ].
		tr to = #empty ifTrue:
			[ (equations at: tr from) add: (Array with: tr with: -1) ].
		((tr from ~= #empty) and: [ tr to ~= #empty ]) ifTrue:[ 
			(equations at: tr from) add: (Array with: tr with: -1).
			(equations at: tr to) add: (Array with: tr with: 1) ]
		 ].
	^ equations