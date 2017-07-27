public-api
extends: arg1
	| tmp1 |
	tmp1 := id.
	self
		become: (self class withId: arg1) copy;
		id: tmp1