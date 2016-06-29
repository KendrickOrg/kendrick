as yet unclassified
routesFrom: aCountryName toAll: countryNames
	countryNames do: [ :toCountryName|
		routes add: aCountryName -> toCountryName ]