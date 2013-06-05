as yet unclassified
browser
	| browser |
	browser := GLMTabulator new.
	browser title: self title.
	browser
		column: #titles;
		column: #example span: 5.
	(browser transmit)
		to: #titles;
		andShow: [ :a | 
					(a list)
						sorted: [ :e1 :e2 | (e1 argumentAt: 1) < (e2 argumentAt: 1) ];
						format: [ :each | each argumentAt: 1 ] ].
	(browser transmit)
		from: #titles;
		to: #example;
		andShow: [ :a | 
					(a dynamic)
						title: 'Browser';
						presentation: [ :some :each | some custom: ((self browserFromPragma: each) startOn: (Compiler evaluate: (each argumentAt: 2) logged: false)) ].
					(a text)
						title: 'Source code';
						forSmalltalk: self class;
						display: [ :each | self sourceFromPragma: each ] ].
	^ browser