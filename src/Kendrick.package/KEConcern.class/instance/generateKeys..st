general
generateKeys: aTransitionList
	|tmp|
	tmp := Dictionary new.
	aTransitionList do: [ :t| 
		tmp at: t from put: 0.
		tmp at: t to put: 0.	
	].
	^ tmp keys
