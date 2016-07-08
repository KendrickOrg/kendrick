as yet unclassified
routesFrom: aCountryName toAll: countryNames
	countryNames do: [ :toCountryName|
		edges add: aCountryName -> toCountryName ]