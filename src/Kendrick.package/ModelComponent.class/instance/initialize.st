protected
initialize

	super initialize.
	backEndEntity := KEModel new.
	parameters at: #N put: nil. "seems to be a default one"