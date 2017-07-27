adding
addEquations: arg1
	arg1 do: [ :arg2 | self addEquation: arg2 ]