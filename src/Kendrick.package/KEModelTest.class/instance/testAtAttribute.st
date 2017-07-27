tests
testAtAttribute
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		addAttribute: #species value: #(#reservoir1 #reservoir2 #mosquito).
	self
		assert: (tmp1 atAttribute: #status) size equals: 3;
		assert: (tmp1 atAttribute: #species) size equals: 3