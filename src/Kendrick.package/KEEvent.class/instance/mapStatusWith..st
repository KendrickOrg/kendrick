accessing
mapStatusWith: arg1
	fromStatus = #empty & (arg1 fromStatus ~= #empty)
		ifTrue: [ fromStatus := arg1 fromStatus ].
	toStatus = #empty & (arg1 toStatus ~= #empty)
		ifTrue: [ toStatus := arg1 toStatus ]