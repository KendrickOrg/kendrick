accessing
size: aNumber
	|population|
	population := KEPopulation new.
	population initialSize: aNumber.
	^ population