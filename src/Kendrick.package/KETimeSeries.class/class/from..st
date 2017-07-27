accessing
from: arg1
	| tmp2 |
	tmp2 := super new.
	tmp2 data: arg1.
	^ tmp2 index: (1 to: arg1 size) asArray