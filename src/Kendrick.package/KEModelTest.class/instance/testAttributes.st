tests
testAttributes
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		attributes:
			{(#status -> #(#S #I #R)).
			(#species -> #(#mosquito #reservoir1 #reservoir2))}.
	self
		assert: (tmp1 attributes at: #status) size equals: 3;
		assert: (tmp1 attributes at: #species) size equals: 3