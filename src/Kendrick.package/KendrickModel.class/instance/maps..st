public-api
maps: arg1
	map := Map withId: arg1.
	self attribute: map attributeToRegions.
	borders := map borders