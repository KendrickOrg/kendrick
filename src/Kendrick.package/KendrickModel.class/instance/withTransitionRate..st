public-api
withTransitionRate: aSymbolArray

	aSymbolArray do: [ :var | parameters at: var put: 0 ].
	self imports: borders using: aSymbolArray first.