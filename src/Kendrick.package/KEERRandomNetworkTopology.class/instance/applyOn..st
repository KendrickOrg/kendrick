instance creation
applyOn: arg1
	arg1 nodes do: [ :arg2 | self appendNode: arg2 label -> arg1 ]