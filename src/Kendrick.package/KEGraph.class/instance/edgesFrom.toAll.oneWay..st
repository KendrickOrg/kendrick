public
edgesFrom: arg1 toAll: arg2 oneWay: arg3
	arg2
		do: [ :arg4 | 
			edges add: arg1 -> arg4.
			(self atNode: arg1) addAdjacentNode: arg4.
			arg3
				ifFalse: [ edges add: arg4 -> arg1.
					(self atNode: arg4) addAdjacentNode: arg1 ] ]