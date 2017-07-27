public-api
withTransitionRate: arg1
	arg1 do: [ :arg2 | parameters at: arg2 put: 0 ].
	self imports: borders using: arg1 first