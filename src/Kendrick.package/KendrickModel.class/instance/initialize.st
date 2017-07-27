protected
initialize
	super initialize.
	backEndEntity := KEModelPart new.
	structuralDependencies := OrderedCollection new.
	delays := OrderedCollection new