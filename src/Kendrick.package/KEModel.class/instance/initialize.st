as yet unclassified
initialize
	super initialize.
	parameters := Dictionary new.
	equations := OrderedCollection new.
	population := KEPopulation new.
	transitions := OrderedCollection new.
	"Delete after the new version is completed"
	oldVersion := true.	

