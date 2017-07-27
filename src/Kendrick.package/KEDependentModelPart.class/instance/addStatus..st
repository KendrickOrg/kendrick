operators
addStatus: arg1
	arg1 do: [ :arg2 | self atAttribute: #status add: arg2 ]