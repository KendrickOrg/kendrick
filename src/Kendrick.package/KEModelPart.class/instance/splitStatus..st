operators
splitStatus: arg1
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := arg1 first.
	tmp2 := arg1 second key.
	tmp3 := arg1 second value.
	tmp1 = #all
		ifTrue: [ ^ self splitStatus: (self atAttribute: #status) ].
	tmp1
		ifNil: [ ^ self error: 'Concern does not contains status attribute' ].
	tmp3
		do: [ :arg2 | 
			tmp1
				do: [ :arg3 | 
					self
						atAttribute: #status
						add: (arg3 asString , arg2 asString) asSymbol ] ].
	tmp5 := Dictionary
		newFrom:
			(tmp1
				collect: [ :arg4 | 
					arg4
						-> (tmp3 collect: [ :arg5 | (arg4 asString , arg5 asString) asSymbol ]) ]).
	tmp4 := self transitions
		select: [ :arg6 | 
			(tmp1 includes: (arg6 from at: #status))
				| (tmp1 includes: (arg6 to at: #status)) ].
	tmp4
		do: [ :arg7 | 
			| tmp6 tmp7 tmp8 |
			tmp6 := OrderedCollection new.
			(tmp1 includes: (arg7 from at: #status))
				ifTrue: [ (tmp1 includes: (arg7 to at: #status))
						ifTrue: [ tmp7 := tmp3 size.
							1 to: tmp7 do: [ :tmp9 | 
								tmp8 := nil.
								tmp8 := KETransition
									from: arg7 from copy
									to: arg7 to copy
									probability: arg7 probability.
								tmp8 from
									at: #status
									put: ((tmp5 at: (arg7 from at: #status)) at: tmp9).
								tmp8 to
									at: #status
									put: ((tmp5 at: (arg7 to at: #status)) at: tmp9).
								tmp4 add: tmp8 ] ]
						ifFalse: [ tmp6
								addAll:
									((tmp5 at: (arg7 from at: #status))
										collect: [ :arg8 | 
											| tmp10 |
											tmp10 := KETransition
												from: arg7 from copy
												to: arg7 to copy
												probability: arg7 probability.
											tmp10 from at: #status put: arg8.
											tmp10 ]) ] ]
				ifFalse: [ tmp6
						addAll:
							((tmp5 at: (arg7 to at: #status))
								collect: [ :arg9 | 
									| tmp11 |
									tmp11 := KETransition
										from: arg7 from copy
										to: arg7 to copy
										probability: arg7 probability.
									tmp11 to at: #status put: arg9.
									tmp11 ]) ].
			self transitions addAll: tmp6.
			arg7 probability: 0 ]