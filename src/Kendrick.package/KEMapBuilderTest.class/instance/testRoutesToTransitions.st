as yet unclassified
testRoutesToTransitions
	| tmp1 |
	tmp1 := KEMapBuilder new.
	tmp1
		countries: #(#MyanmarBurma #Cambodia #Laos #Malaysia #Thailand #Vietnam);
		routesFrom: #VietNam toAll: #(#Laos #Cambodia);
		routesFrom: #Laos toAll: #(#Vietnam #Thailand #Cambodia);
		routesFrom: #Cambodia toAll: #(#Vietnam #Laos #Thailand);
		routesFrom: #Thailand
			toAll: #(#Laos #Cambodia #MyanmarBurma #Malaysia).
	self assert: (tmp1 routesToTransitions: 'rho') size equals: 12