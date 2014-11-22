as yet unclassified
initialize
	super initialize.
	parameters := Dictionary new.
	temporalParameters := Dictionary new.
	equations := OrderedCollection new.
	population := KEPopulation new.
	compartmentSymbols := Dictionary new.
	transitions := OrderedCollection new.
	"Delete after the new version is completed"
	oldVersion := true.	

