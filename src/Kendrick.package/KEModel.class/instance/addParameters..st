adding
addParameters: arg1
	arg1 do: [ :arg2 | self addParameter: arg2 key value: arg2 value ]