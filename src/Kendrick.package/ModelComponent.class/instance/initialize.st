protected
initialize
	super initialize.
	backEndEntity := KEModel new.
	parameters at: #N put: nil