general
generateKeys: arg1
	| tmp1 |
	tmp1 := Dictionary new.
	arg1
		do: [ :arg2 | 
			tmp1
				at: arg2 from put: 0;
				at: arg2 to put: 0 ].
	^ tmp1 keys