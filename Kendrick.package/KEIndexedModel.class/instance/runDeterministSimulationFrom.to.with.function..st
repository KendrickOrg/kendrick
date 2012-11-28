as yet unclassified
runDeterministSimulationFrom: x0 to: xn with: step function: func

| solverRK yy diag1 diag2 diag3 diagComposite xValue nbIteration nbSpecies r g b|
solverRK := RungeKuttaSolver on:self.
solverRK finalValueOfX: xn.
solverRK initialValueOfX: x0.
solverRK stepSize: step. 

yy := solverRK rk4Solve2.
nbIteration := ((xn - x0)/step) rounded.
nbSpecies := self numberOfSpecies.
r:=Random new.
g:=Random new.
b:=Random new.
"Get function of yy"
func ifNotNil: [
	1 to: nbSpecies do:[:id|
		1 to: nbIteration do: [:j|
			(func = #sqrt) ifTrue:[
				((yy at: id) at: j) at: 2 put: ((((yy at: id) at: j) at: 2) sqrt)].
			(func = #log) ifTrue: [
				((yy at: id) at: j) at: 2 put: ((((yy at: id) at: j) at: 2) log).
				].
			].		
		].
	].
	
"Draw a composite diagram"
	diag1 := (ESDiagramRenderer new lineDiagram)	
		y: #second;					
		defaultColor: (Color r: (r next) g: (g next) b: (b next));		
		yAxisLabel: 'Infected';		
		regularAxis;		
		startLineAtZero;		
		models: (yy at: 1);
		yourself.		
		
	diag2 := (ESDiagramRenderer new lineDiagram)	
		y: #second;		
		defaultColor: (Color r: (r next) g: (g next) b: (b next));			
		models: (yy at: 2);
		yourself.
		
	diag3 := (ESDiagramRenderer new lineDiagram)	
		y: #second;					
		defaultColor: (Color r: (r next) g: (g next) b: (b next));				
		models: (yy at: 3);
		yourself.		
		
diagComposite := ESDiagramRenderer new.
(diagComposite compositeDiagram)
	add: diag1;
	add: diag2;
	add: diag3;
	width: 1200;
	height: 500;
	preferredAxisMaxY: 50.
 ^diagComposite open.
		


 