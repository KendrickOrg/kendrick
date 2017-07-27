public-api
sumOverTimeSeries: arg1
	| tmp1 tmp2 tmp3 |
	tmp2 := (simulation allTimesSeriesContaining: arg1)
		collect: [ :arg2 | arg2 value ].
	tmp1 := OrderedCollection new.
	tmp3 := tmp2 first data size.
	1 to: tmp3 do: [ :tmp4 | tmp1 add: (tmp2 collect: [ :arg3 | arg3 data at: tmp4 ]) sum ].
	^ (KETimeSeries from: tmp1 withIndex: tmp2 first index)
		compartment: (STON fromString: arg1)