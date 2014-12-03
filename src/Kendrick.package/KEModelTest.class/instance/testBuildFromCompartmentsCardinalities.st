tests-as yet unclassified
testBuildFromCompartmentsCardinalities
	|model|
	model := KEModel new.
	model buildFromCompartments: 
			{(#specie->#(#Mosquito #Reservoir1 #Reservoir2)). (#status->#(#S #I #R))}   			cardinalities: #(9999 1 0 999 1 0 1999 1 0).
	self assert: (model compartments size) equals: 9.
	self assert: (model compartments isDictionary) equals: true