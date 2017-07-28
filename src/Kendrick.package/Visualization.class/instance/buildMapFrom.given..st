as yet unclassified
buildMapFrom: attribute given: compositeCompartments

	|mapConcern countries|

	mapConcern := (simulation compo 
		concerns select: [ :concern | concern attributes keys includes: attribute ]) first.	
	
	countries := (compositeCompartments collect: [ :item | 
			(item select: [ :assoc | 
				assoc key asSymbol = attribute asSymbol  ]) collect: #value ]) flatten.
		
	diag countries: (mapConcern attributes at: attribute).
	
	mapConcern transitions do: [ :transition | 
		diag routesFrom: transition key key toAll: { transition value }
	].
	
	