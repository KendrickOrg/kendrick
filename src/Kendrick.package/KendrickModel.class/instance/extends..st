public-api
extends: arg1
	super extends: arg1.
	structuralDependencies := {arg1}.
	transitions := OrderedCollection new.
	extending := backEndEntity.
	backEndEntity := KEModelPart dependOn: backEndEntity