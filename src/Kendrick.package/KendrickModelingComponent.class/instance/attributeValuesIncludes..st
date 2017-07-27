protected
attributeValuesIncludes: arg1
	^ (attributes values select: [ :arg2 | arg2 includes: arg1 ]) isEmpty
		not