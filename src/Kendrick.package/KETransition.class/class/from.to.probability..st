instance creation
from: arg1 to: arg2 probability: arg3
	| tmp2 |
	tmp2 := self new.
	tmp2
		from: arg1;
		to: arg2.
	^ tmp2 probability: arg3