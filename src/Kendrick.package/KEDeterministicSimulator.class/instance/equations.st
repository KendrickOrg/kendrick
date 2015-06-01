as yet unclassified
equations
	equations := Dictionary new.
	model population compartments keys do: [ :k| equations at: k put: OrderedCollection new ].
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