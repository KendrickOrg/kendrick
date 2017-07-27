as yet unclassified
routesFrom: arg1 toAll: arg2
	arg2 do: [ :arg3 | routes add: arg1 -> arg3 ]