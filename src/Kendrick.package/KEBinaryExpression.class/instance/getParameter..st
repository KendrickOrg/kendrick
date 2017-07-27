printing
getParameter: arg1
	| tmp1 |
	tmp1 := leftHandSide getParameter: arg1.
	tmp1 ifNil: [ tmp1 := rightHandSide getParameter: arg1 ].
	^ tmp1