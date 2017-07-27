as yet unclassified
from: arg1 withIndex: arg2 compartment: arg3
	| tmp2 |
	tmp2 := super new.
	tmp2
		data: arg1;
		index: arg2.
	^ tmp2 compartment: arg3