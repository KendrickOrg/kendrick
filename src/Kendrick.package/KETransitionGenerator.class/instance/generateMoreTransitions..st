as yet unclassified 
generateMoreTransitions: tr
	| count keys trans temp |
	count := 1.
	trans := OrderedCollection new.
	temp := OrderedCollection new.
	temp add: tr.
	model attributes
		keysDo: [ :each | 
			| trs |
			count > 1
				ifTrue: [ keys := model attributes at: each.
					trs := OrderedCollection new.
					1 to: keys size do: [ :elem | 
						| t assoc |
						temp
							do: [ :member | 
								assoc := each -> (keys at: elem).
								t := self addAssociation: assoc Into: member At: elem.
								trs add: t ] ].
					temp := trs.
					count = model attributes keys size
						ifTrue: [  ]
						ifFalse: [  ].
					trans addAll: trs ].
			count := count + 1 ].
	^ trans