public-api
maps: aMapEntity

	map := Map withId: aMapEntity.
	self attribute: map attributeToRegions.
	borders := map borders.