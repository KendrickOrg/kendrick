public-api
extends: anotherConcernName

	super extends: anotherConcernName.
	structuralDependencies := {  anotherConcernName }.
	transitions := OrderedCollection new.
	extending := backEndEntity.
	backEndEntity := KEModelPart dependOn: backEndEntity.