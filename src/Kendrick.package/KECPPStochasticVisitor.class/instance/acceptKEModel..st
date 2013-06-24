as yet unclassified
acceptKEModel: aNode
	|working fileName|
	
	numberOfEvent :=0.
	rateOfListEvent  := OrderedCollection new.
	streamForTranslator  := WriteStream on: (String new: 60). 
	"Get the name of the model as the name of cpp file"
	fileName := self getFileName: aNode.
	"Initialize a file in which all code cpp generated will be saved"
	working := FileSystem disk workingDirectory.
	stream := (working / fileName) writeStream.
	"Traverse the model and visit each node"
	self prepareCPPFile.
	"visit all compartments"
	stream nextPutAll: '//# stochastic model';cr.
"	stream nextPutAll: '#define INT_MAX 32768';cr."
	stream nextPutAll: '#define ENDTIME   1.0		// end of time';cr.
	stream nextPutAll: '#define TIMESTEP  0.005		// interval of output';cr.
	stream nextPutAll: '	#define NB_EVENTS  ' , (aNode eventList  size) asString ;cr.
	stream nextPutAll: '#define nbOfCompartment ', (aNode compartments size) asString;cr.
	stream nextPutAll: '#define nbOfSpecies ', (aNode numberOfSpecies  ) asString;cr.
	stream nextPutAll: 'double initialValue[nbOfCompartment * nbOfSpecies];';cr.
	stream nextPutAll: 'string compartmentName[nbOfCompartment * nbOfSpecies];';cr;cr.
	stream nextPutAll: 'double x[nbOfCompartment * nbOfSpecies];';cr;cr.
	stream nextPutAll: 'double rates[nbOfCompartment * nbOfSpecies];';cr;cr.
	
	"visit all parameters"
	aNode parameters do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
	
	stream nextPutAll: 'void initializeCompartments()';cr.
	stream nextPutAll: '{';cr.
	aNode compartments do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
	stream nextPutAll: '}';cr.
	
	
	"function calculate sum"
	stream nextPutAll: 'double sum(double a[], int n){';cr.
	stream nextPutAll: 'int i;';cr.
	stream nextPutAll: 'double s=0.0;';cr.
	stream nextPutAll: 'for(i=0; i<n; i++)';cr.
	stream nextPutAll: '	s += a[i];';cr.
	stream nextPutAll: 'return(s);';cr.
	stream nextPutAll: '}';cr.
	
	"choice action"
	stream nextPutAll: 'int select_reaction(double p[], int pn, double sum_propencity, double r){';cr.
	stream nextPutAll: String tab,'int reaction = -1;';cr.
	stream nextPutAll: String tab,'double sp = 0.0;';cr.
	stream nextPutAll: String tab,'int i;';cr.
	stream nextPutAll: String tab,'r = r * sum_propencity;';cr.
	stream nextPutAll: String tab,'for(i=0; i<pn; i++){';cr.
		stream nextPutAll: String tab,String tab,'sp += p[i];';cr.
		stream nextPutAll: String tab,String tab,'if(r < sp){';cr.
			stream nextPutAll: String tab,String tab,String tab,'reaction = i;';cr.
			stream nextPutAll: String tab,String tab,String tab,'break;';cr.
		stream nextPutAll: String tab,String tab,String tab,'}';cr.
	stream nextPutAll: String tab,String tab,'}';cr.
	stream nextPutAll: String tab,String tab,'return reaction;';cr.
	stream nextPutAll: String tab,'}';cr.
	
	
	"visit all equations"
	"stream nextPutAll: 'void modelEquations( const state_type &x , state_type &dxdt , double t )';cr.
	stream nextPutAll: '{';cr."
	aNode equations do: [:each|
		"stream nextPutAll: ("self visitNode: each")."
		].

"	stream nextPutAll: '}';cr."
	
	"visit all actions in parallel with events"
	streamForTranslator nextPutAll: 'void Transition(int pEvent)';cr.
	streamForTranslator nextPutAll: '{';cr.
	streamForTranslator nextPutAll: String tab, 'switch(pEvent){';cr.
	        
	"visit all list event"
	stream nextPutAll: 'void CalculRate()';cr.
	stream nextPutAll: '{';cr.
		aNode eventList  do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
	stream nextPutAll: '}';cr.
	
	"end of visitor actions"
	streamForTranslator nextPutAll: String tab,'}';cr. "end of switch case "
	streamForTranslator nextPutAll: '}';cr.
	
	stream nextPutAll: (streamForTranslator contents ).
	
	"stream nextPutAll: (rateOfListEvent asString ) ."
	
	"main function"
	stream nextPutAll: 'int main(void){';cr.
	stream nextPutAll: String tab,'// initialization';cr.
	stream nextPutAll: String tab,'double sum_propencity = 0.0;	// sum of propencities';cr.
	stream nextPutAll: String tab,'double t=0.0;			// time';cr.
	stream nextPutAll: String tab,'double r;			// random number';cr.
	stream nextPutAll: String tab,'int reaction;			// reaction number selected';cr.
				
	"init value"
	stream nextPutAll: String tab,'	for (int i = 0; i < 	nbOfCompartment * nbOfSpecies; i++)';cr.
	stream nextPutAll: String tab,String tab,'x[i] = initialValue[i];';cr.
		
		stream nextPutAll: String tab,'while(t < ENDTIME){';cr.
		stream nextPutAll: String tab,String tab,'CalculRate();';cr.
		stream nextPutAll: String tab,String tab,'sum_propencity = sum(rates, NB_EVENTS);';cr.
		
		stream nextPutAll: String tab,String tab,'// select reaction';cr.
		stream nextPutAll: String tab,String tab,'r = (double)rand()/INT_MAX;';cr.
		stream nextPutAll: String tab,String tab,'reaction = select_reaction(rates, NB_EVENTS, sum_propencity, r);';cr.
		stream nextPutAll: String tab,String tab,'Transition(reaction);';cr.		
		stream nextPutAll: String tab,String tab,'t += TIMESTEP;';cr.
		stream nextPutAll: String tab,'	for (int i = 0; i < 	nbOfCompartment * nbOfSpecies; i++)';cr.
		stream nextPutAll: String tab,'	cout << x[i] << "   " ;';cr.
		stream nextPutAll: String tab,'	cout << endl;';cr.
		stream nextPutAll: String tab,'}';cr.
      "end of main function"				
	stream nextPutAll: '}';cr.
	
	"Enregistrer le fichier"
	stream close.