tests
testBuildFromAttributesCompartments2
	|model|
	model := KEModel new.
	model buildFromAttributes: #(#status #region) 
			compartments: { 
				#(#S #Sud)->999. 
				#(#I #Sud)->1. 
				#(#R #Sud)->0.
				#(#S #North)->1000.
				#(#I #North)->0.
				#(#R #North)->0 }.
	self assert: (model population compartments isDictionary) equals: true