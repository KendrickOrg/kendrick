as yet unclassified
updateAttributes: aDictionary
	aDictionary keysAndValuesDo: [ :k :v| self attributes at: k put: v ]
	