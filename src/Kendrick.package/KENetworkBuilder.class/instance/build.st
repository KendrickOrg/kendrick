as yet unclassified
build
	|b lb|
	b := RTMondrian new.
	b shape circle.
	b nodes: network nodes.
	b shape line color: (Color gray).
	b edges connectTo: [ :n| n adjacentNodes collect: [ :e| network atNode: e ] ]. 
	b normalizer 
		normalizeSize: [ :n|  ].
	

	lb := RTLegendBuilder new.
	lb view: b view.
	lb addText: 'Circle = node, size = number of infectious; gray links = contact;'.
	lb addText: 'green circle = susceptible; red circle = infectious; yellow circle = recovery; gray circle = others'.
	lb build.