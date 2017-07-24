as yet unclassified
isResponsibleFor: commandLineArguments

	"commandLineArguments withFirstArgument: [ :arg|
		(#('--epiRun') includes: arg)
		ifTrue: [ ^ true ]]."
	
	^ commandLineArguments includesSubCommand: self commandName