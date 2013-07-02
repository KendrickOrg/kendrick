as yet unclassified
acceptKEModel: aNode
	|working fileName|
	
	numberOfEvent :=0.		
	"Get the name of the model as the name of cpp file"
	fileName := self getFileName: aNode.
	"Initialize a file in which all code cpp generated will be saved"
	working := FileSystem disk workingDirectory.
	stream := (working / fileName) writeStream.
	"Traverse the model and visit each node"
	self prepareCPPFile.
	function := ''.
	isDeterministic := false.
	"define some global variables"		
	stream nextPutAll: 'const double TMAX = ',	 '(double)', aNode simulator tMax asString, ';';cr.
	stream nextPutAll: 'const double TMIN = ', '(double)', aNode simulator tMin asString, ';';cr.
	stream nextPutAll: 'const int NB_EVENTS = ' , (aNode eventList  size) asString, ';';cr;cr.
	
	stream nextPutAll: 'const int nbOfCompartments = ', aNode numberOfCompartments asString, ';';cr.
	stream nextPutAll: 'const int nbOfSpecies = ', aNode numberOfSpecies asString, ';';cr;cr.
	
	stream nextPutAll: 'double initialValue[nbOfCompartments][nbOfSpecies];';cr.
	stream nextPutAll: 'string compartmentName[nbOfCompartments];';cr.
	stream nextPutAll: 'double x[nbOfCompartments][nbOfSpecies];';cr.
	stream nextPutAll: 'double rates[NB_EVENTS];';cr;cr.
	
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
	
	"visit all actions of events"
	strInitializeTrans nextPutAll: 'void Transition(int pEvent)';cr.
	strInitializeTrans nextPutAll: '{';cr.
	strInitializeTrans nextPutAll: String tab, 'switch(pEvent) {';cr.
	        
	"visit all events"
	stream nextPutAll: 'void CalculRate()';cr.
	stream nextPutAll: '{';cr.
		aNode eventList  do: [:each|
			stream nextPutAll: (self visitNode: each).
		].
	stream nextPutAll: '}';cr.
	
	"end of visitor actions"
	strInitializeTrans nextPutAll: String tab, String tab, 'default: cout<<"Error"<<endl;';cr.
	strInitializeTrans nextPutAll: String tab, String tab, String tab, 'break;';cr.
	strInitializeTrans nextPutAll: String tab, '}';cr. "end of switch case "
	strInitializeTrans nextPutAll: '}';cr.
	
	stream nextPutAll: (strInitializeTrans contents ).
	
	"main function"
	stream nextPutAll: 'int main(void){';cr.
	stream nextPutAll: String tab,'double sumOfRates = 0.0;';cr.
	stream nextPutAll: String tab,'double t = 0.0;';cr.
	stream nextPutAll: String tab,'double r = 0.0;';cr.
	stream nextPutAll: String tab,'int event = -1;';cr.
	stream nextPutAll: String tab, 'double tOffset = 0.0;';cr.
				
	"init value"
	stream nextPutAll: String tab, '//Initialize all values of x';cr.
	stream nextPutAll: String tab, 'initializeCompartments();';cr.
	stream nextPutAll: String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	stream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'x[i][j] = initialValue[i][j];';cr.	
	stream nextPutAll: String tab, '//Begin of algorithm Gillespie';cr.	
	stream nextPutAll: String tab, 'while (t < TMAX) {';cr.
	stream nextPutAll: String tab, String tab, '//calculation of rates';cr.
	stream nextPutAll: String tab, String tab,'CalculRate();';cr.
	stream nextPutAll: String tab, String tab, 'for (int i = 0; i < NB_EVENTS; i++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'rates[i] = abs(rates[i]);';cr.
	stream nextPutAll: String tab, String tab, '//Sum of rates';cr.
	stream nextPutAll: String tab, String tab,'sumOfRates = sum(rates, NB_EVENTS);';cr.
	stream nextPutAll: String tab, String tab, '//Generation of time for the next calculation';cr.
	stream nextPutAll: String tab, String tab, 'tOffset = (-1/sumOfRates)*log((double)(rand()+1)/RAND_MAX);';cr.
	stream nextPutAll: String tab, String tab, 't += tOffset;';cr.
	stream nextPutAll: String tab, String tab, '//select event';cr.
	stream nextPutAll: String tab, String tab, 'r = (double)(rand()+1)/RAND_MAX ;';cr.
	stream nextPutAll: String tab, String tab, 'event = selectEvent(rates, NB_EVENTS, sumOfRates, r);';cr.
	stream nextPutAll: String tab, String tab, 'Transition(event);';cr.
	stream nextPutAll: String tab, String tab, 'cout << t << "	";';cr.	
	stream nextPutAll: String tab, String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'cout <<', function, '(x[i][j]) << "   ";';cr.
	stream nextPutAll: String tab, String tab, 'cout << endl;';cr.
	stream nextPutAll: String tab, '}';cr.
      "end of main function"				
	stream nextPutAll: '}';cr.
	
	"Enregistrer le fichier"
	stream close.