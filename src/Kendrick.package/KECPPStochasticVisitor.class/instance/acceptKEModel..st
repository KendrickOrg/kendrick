as yet unclassified
acceptKEModel: aNode
	|working fileName|
	
	numberOfEvent :=0.	
	streamOfTransaction  := WriteStream on: (String new: 60). 
	"Get the name of the model as the name of cpp file"
	fileName := self getFileName: aNode.
	"Initialize a file in which all code cpp generated will be saved"
	working := FileSystem disk workingDirectory.
	stream := (working / fileName) writeStream.
	"Traverse the model and visit each node"
	self prepareCPPFile.
	"define some global variables"
	stream nextPutAll: '//stochastic model';cr.
	stream nextPutAll: '#define TMAX ',	 aNode simulator tMax asString, '	// end of time';cr.
	stream nextPutAll: '#define NB_EVENTS  ' , (aNode eventList  size) asString ;cr.
	stream nextPutAll: '#define nbOfCompartment ', (aNode compartments size) asString;cr.
	stream nextPutAll: '#define nbOfSpecies ', (aNode numberOfSpecies  ) asString;cr.
	stream nextPutAll: 'double initialValue[nbOfCompartment * nbOfSpecies];';cr.
	stream nextPutAll: 'string compartmentName[nbOfCompartment * nbOfSpecies];';cr.
	stream nextPutAll: 'double x[nbOfCompartment * nbOfSpecies];';cr.
	stream nextPutAll: 'double rates[nbOfCompartment * nbOfSpecies];';cr.
	
	"visit all parameters"
	aNode parameters do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
	"visit all compartments"
	stream nextPutAll: 'void initializeCompartments()';cr.
	stream nextPutAll: '{';cr.
	aNode compartments do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
	stream nextPutAll: '}';cr.
	
	
	"function calculate sum"
	stream nextPutAll: 'double sum(double a[], int n){';cr.
	stream nextPutAll: String tab, 'int i;';cr.
	stream nextPutAll: String tab, 'double s=0.0;';cr.
	stream nextPutAll: String tab, 'for(i=0; i<n; i++)';cr.
	stream nextPutAll: String tab, String tab, 's += a[i];';cr.
	stream nextPutAll: String tab, 'return(s);';cr.
	stream nextPutAll: '}';cr.
	
	"choose action"
	stream nextPutAll: 'int selectEvent(double rates[], int nbEvents, double sumOfRates, double r){';cr.
	stream nextPutAll: String tab, 'int event = -1;';cr.
	stream nextPutAll: String tab, 'double sp = 0.0;';cr.
	stream nextPutAll: String tab, 'int i;';cr.
	stream nextPutAll: String tab, 'double p = 0.0;';cr.
	stream nextPutAll: String tab, 'p = r * sumOfRates;';cr.
	stream nextPutAll: String tab, 'for(i=0; i<nbEvents; i++){';cr.
		stream nextPutAll: String tab, String tab,'sp += rates[i];';cr.
		stream nextPutAll: String tab, String tab,'if (p <= sp) {';cr.
			stream nextPutAll: String tab, String tab, String tab,'event = i;';cr.
			stream nextPutAll: String tab, String tab, String tab,'break;';cr.
		stream nextPutAll: String tab, String tab, String tab,'}';cr.
	stream nextPutAll: String tab, String tab,'}';cr.
	stream nextPutAll: String tab, 'return event;';cr.
	stream nextPutAll: String tab, '}';cr.
	
	
	"visit all equations"
	"stream nextPutAll: 'void modelEquations( const state_type &x , state_type &dxdt , double t )';cr.
	stream nextPutAll: '{';cr."
	aNode equations do: [:each|
		"stream nextPutAll: ("self visitNode: each")."
		].

"	stream nextPutAll: '}';cr."
	
	"visit all actions of events"
	streamOfTransaction nextPutAll: 'void Transition(int pEvent)';cr.
	streamOfTransaction nextPutAll: '{';cr.
	streamOfTransaction nextPutAll: String tab, 'switch(pEvent) {';cr.
	        
	"visit all events"
	stream nextPutAll: 'void CalculRate()';cr.
	stream nextPutAll: '{';cr.
		aNode eventList  do: [:each|
			stream nextPutAll: (self visitNode: each).
		].
	stream nextPutAll: '}';cr.
	
	"end of visitor actions"
	streamOfTransaction nextPutAll: String tab, String tab, 'default: cout<<"Error"<<endl;';cr.
	streamOfTransaction nextPutAll: String tab, String tab, String tab, 'break;';cr.
	streamOfTransaction nextPutAll: String tab, '}';cr. "end of switch case "
	streamOfTransaction nextPutAll: '}';cr.
	
	stream nextPutAll: (streamOfTransaction contents ).
	
	"main function"
	stream nextPutAll: 'int main(void){';cr.
	stream nextPutAll: String tab,'double sumOfRates = 0.0;	// sum of rates';cr.
	stream nextPutAll: String tab,'double t = 0.0;			// time';cr.
	stream nextPutAll: String tab,'double r;			// random number';cr.
	stream nextPutAll: String tab,'int event = -1;			// event number selected';cr.
				
	"init value"
	stream nextPutAll: String tab, '//Initialize all values of x';cr.
	stream nextPutAll: String tab, 'initializeCompartments();';cr.
	stream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartment * nbOfSpecies; i++)';cr.
	stream nextPutAll: String tab, String tab, 'x[i] = initialValue[i];';cr.	
	stream nextPutAll: String tab, '//Begin of algorithm Gillespie';cr.	
	stream nextPutAll: String tab, 'while (t < TMAX) {';cr.
	stream nextPutAll: String tab, String tab, '//calculation of rates';cr.
	stream nextPutAll: String tab, String tab,'CalculRate();';cr.
	stream nextPutAll: String tab, String tab, 'for (int i = 0; i < NB_EVENTS; i++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'rates[i] = abs(rates[i]);';cr.
	stream nextPutAll: String tab, String tab, '//Sum of rates';cr.
	stream nextPutAll: String tab, String tab,'sumOfRates = sum(rates, NB_EVENTS);';cr.
	stream nextPutAll: String tab, String tab, '//Generation of time for the next calculation';cr.
	stream nextPutAll: String tab, String tab, 'double tOffset = (-1/sumOfRates)*log(rand()/(double)RAND_MAX);';cr.
	stream nextPutAll: String tab, String tab, 't += tOffset;';cr.
	stream nextPutAll: String tab, String tab, '//select event';cr.
	stream nextPutAll: String tab, String tab, 'r = rand()/(double)RAND_MAX ;';cr.
	stream nextPutAll: String tab, String tab, 'event = selectEvent(rates, NB_EVENTS, sumOfRates, r);';cr.
	stream nextPutAll: String tab, String tab, 'Transition(event);';cr.	
	stream nextPutAll: String tab, String tab, 'for (int i = 0; i < nbOfCompartment * nbOfSpecies; i++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'cout << x[i] << "   " ;';cr.
	stream nextPutAll: String tab, String tab, 'cout << endl;';cr.
	stream nextPutAll: String tab, '}';cr.
      "end of main function"				
	stream nextPutAll: '}';cr.
	
	"Enregistrer le fichier"
	stream close.