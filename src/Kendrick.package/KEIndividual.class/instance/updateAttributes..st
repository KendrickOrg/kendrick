update
updateAttributes: aDictionary
	aDictionary keysAndValuesDo: [ :k :v| attributes at: k put: v ]
	