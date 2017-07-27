as yet unclassified
appendNode: arg1
	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := arg1 key.
	tmp2 := arg1 value.
	tmp3 := Random new.
	tmp4 := tmp1.
	activeNodes
		do: [ :arg2 | 
			| tmp5 tmp6 tmp7 |
			(arg2 - tmp4) abs \\ (tmp2 nodes size - (K // 2)) <= (K // 2)
				ifTrue: [ beta > tmp3 next
						ifTrue: [ | tmp8 |
							tmp6 := tmp2 nodes at: arg2.
							tmp8 := tmp6.
							[ tmp8 label ~= tmp6 label
								and: [ (tmp6 adjacentNodes select: [ :arg3 | arg3 = tmp8 label ]) isEmpty ] ]
								whileFalse: [ tmp7 := (tmp2 nodes size * tmp3 next) ceiling.
									tmp8 := tmp2 nodes at: tmp7 ].
							tmp2
								edgesFrom: (tmp2 nodes at: arg2) label
									toAll: (Array with: (tmp2 nodes at: tmp7) label)
									oneWay: true;
								edgesFrom: (tmp2 nodes at: tmp4) label
									toAll: (Array with: (tmp2 nodes at: arg2) label)
									oneWay: true ]
						ifFalse: [ tmp2
								edgesFrom: (tmp2 nodes at: tmp4) label
								toAll: (Array with: (tmp2 nodes at: arg2) label) ] ] ];
		add: tmp4