openning
inspect: arg1 label: arg2
	| tmp1 |
	tmp1 := self new.
	tmp1 title: arg2.
	(tmp1 openOn: arg1) fullscreen.
	self splashLogo.
	^ tmp1