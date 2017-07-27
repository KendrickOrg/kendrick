instance creation
openOn: arg1
	| tmp1 |
	tmp1 := self openOn: arg1 with: self defaultRenderer.
	^ tmp1