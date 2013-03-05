grammar
equation

^ super equation ==> [:nodes |
	(nodes at: 2) ifNotNil: [
		(nodes at: 3) ifNotNil: [
			((nodes at: 2) at: 3) ifNil: [
				"S[i]:t=ex"
				(KEEquation new)
				variable: ((KEVariable new) symbol: (nodes first) value asSymbol);
				tVariable: ((KEVariable new) symbol: ((nodes at: 3) at: 2) value asSymbol);
				idVariable: ((nodes at: 2) at: 2) value asSymbol;
				idVariable2: nil;
				eqIndex: nil;
				eqIndex2: nil;
				expression: nodes last
				]
			ifNotNil: [
				"S[i,j]:t=ex"
				(KEEquation new)
				variable: ((KEVariable new) symbol: (nodes first) value asSymbol);
				tVariable: ((KEVariable new) symbol: ((nodes at: 3) at: 2) value asSymbol);
				idVariable: ((nodes at: 2) at: 2) value asSymbol;
				idVariable2: ((((nodes at: 2) at: 3) at: 1) at: 2) value asSymbol;
				eqIndex: nil;
				eqIndex2: nil;
				expression: nodes last
				]
			]
		ifNil: [
			((nodes at: 2) at: 3) ifNil: [
				"S[i]=ex"
				(KEEquation new)
				variable: ((KEVariable new) symbol: (nodes first) value asSymbol);
				tVariable: nil;
				idVariable: ((nodes at: 2) at: 2) value asSymbol;
				idVariable2: nil;
				eqIndex: nil;
				eqIndex2: nil;
				expression: nodes last
				]
			ifNotNil: [
				"S[i,j]=exp"
				(KEEquation new)
				variable: ((KEVariable new) symbol: (nodes first) value asSymbol);
				tVariable: nil;
				idVariable: ((nodes at: 2) at: 2) value asSymbol;
				idVariable2: ((((nodes at: 2) at: 3) at: 1) at: 2) value asSymbol;
				eqIndex: nil;
				eqIndex2: nil;
				expression: nodes last
				]
			]
		]
	ifNil: [
		(nodes at: 3) ifNotNil: [
			"S:t=exp"
			(KEEquation new)
			variable: ((KEVariable new) symbol: (nodes first) value asSymbol);
			tVariable: ((KEVariable new) symbol: ((nodes at: 3) at: 2) value asSymbol);
			idVariable: nil;
			idVariable2: nil;
			eqIndex: 1;
			eqIndex2: nil;
			expression: nodes last
			]
		ifNil: [
			"S=exp"
			(KEEquation new)
			variable: ((KEVariable new) symbol: (nodes first) value asSymbol);
			tVariable: nil;
			idVariable: nil;
			idVariable2: nil;
			eqIndex: 1;
			eqIndex2: nil;
			expression: nodes last
			]
		] 	
	]