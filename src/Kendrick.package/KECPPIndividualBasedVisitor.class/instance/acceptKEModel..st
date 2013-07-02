as yet unclassified
acceptKEModel: aModelNode
	|working fileName|
	fileName := self getFileName: aModelNode.
	working := FileSystem disk workingDirectory.
	stream := (working / fileName) writeStream.
	function := ''.
	isDeterministic := false.
	self prepareCPPFile.
	"define some global variables"
	stream nextPutAll: 'const double TMAX = ',	 '(double)', aModelNode simulator tMax asString, ';';cr.
	stream nextPutAll: 'const double TMIN = ', '(double)', aModelNode simulator tMin asString, ';';cr.
	stream nextPutAll: 'const double STEP = ', '(double)', aModelNode simulator step asString, ';';cr.
	stream nextPutAll: 'const int NB_EVENTS = ', aModelNode simulator listOfTransitions size asString, ';';cr.
	stream nextPutAll: 'const int POPULATION_SIZE = ', aModelNode simulator getPopulationSize asString, ';';cr;cr.
	
	stream nextPutAll: 'const int nbOfCompartments = ', aModelNode numberOfCompartments asString, ';';cr.
	stream nextPutAll: 'const int nbOfSpecies = ', aModelNode numberOfSpecies asString, ';';cr;cr.
	
	stream nextPutAll: 'double initialValue[nbOfCompartments][nbOfSpecies];';cr.
	stream nextPutAll: 'string compartmentName[nbOfCompartments];';cr.
	stream nextPutAll: 'double x[nbOfCompartments][nbOfSpecies];';cr.
	stream nextPutAll: 'double rates[NB_EVENTS];';cr;cr.
	
	stream nextPutAll: 'struct KEIndividual {';cr.
	stream nextPutAll: String tab, 'string currentStatus;';cr.
	stream nextPutAll: String tab, 'string nextStatus;';cr.
	stream nextPutAll: String tab, 'int specieID;';cr.
	stream nextPutAll: '} listOfIndividuals[POPULATION_SIZE];';cr;cr.
	
	stream nextPutAll: 'struct KETransition {';cr.
	stream nextPutAll: String tab, 'string fromStatus;';cr.
	stream nextPutAll: String tab, 'string toStatus;';cr.
	stream nextPutAll: String tab, 'int specieID;';cr.
	stream nextPutAll: '} listOfTransitions[NB_EVENTS];';cr;cr.
	
	"visit all parameters"
	aModelNode parameters do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
		
	"visit all compartments"
	stream nextPutAll: 'void initializeCompartments()';cr.
	stream nextPutAll: '{';cr.
	aModelNode compartments do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
	stream nextPutAll: '}';cr;cr.
	
	stream nextPutAll: 'void initializeIndividuals()';cr.
	stream nextPutAll: '{';cr.
	stream nextPutAll: String tab, 'int count = 0;';cr.
	stream nextPutAll: String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	stream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++){';cr.
	stream nextPutAll: String tab, String tab, String tab, 'for (int k = 0; k < initialValue[i][j]; k++){';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'listOfIndividuals[count].currentStatus = compartmentName[i];';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'listOfIndividuals[count].nextStatus = "";';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'listOfIndividuals[count].specieID = j + 1;';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'count += 1;';cr.
	stream nextPutAll: String tab, String tab, String tab, '}';cr.
	stream nextPutAll: String tab, String tab, '}';cr.
	stream nextPutAll: '}';cr;cr.
	
	stream nextPutAll: 'double getNumberOfIndividuals(string currentStatus, int specieID)';cr.
	stream nextPutAll: '{';cr.
	stream nextPutAll: String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	stream nextPutAll: String tab, String tab, 'if (compartmentName[i].compare(currentStatus)==0)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'return x[i][specieID-1];';cr.
	stream nextPutAll: '}';cr;cr.
	
	stream nextPutAll: 'void updateNumberOfIndividuals()';cr.
	stream nextPutAll: '{';cr.
	stream nextPutAll: String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	stream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'x[i][j] = 0;';cr.
	stream nextPutAll: String tab, 'for (int i = 0; i < POPULATION_SIZE; i++){';cr.
	stream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfCompartments; j++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'if (compartmentName[j].compare(listOfIndividuals[i].currentStatus)==0)';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'x[j][listOfIndividuals[i].specieID-1] += 1;';cr.
	stream nextPutAll: String tab, '}';cr.
	stream nextPutAll: '}';cr;cr.
	
	numberOfEvent :=0.	
	strInitializeTrans nextPutAll: 'void initializeTransitions()';cr.
	strInitializeTrans nextPutAll: '{';cr.
	
	stream nextPutAll: 'void calculateRate()';cr.
	stream nextPutAll: '{';cr.
	aModelNode simulator listOfTransitions do: [ :each|
		stream nextPutAll: (self visitNode: each).
		 ].
	stream nextPutAll: '}';cr;cr.
	strInitializeTrans nextPutAll: '}';cr;cr.
	stream nextPutAll: (strInitializeTrans contents).
	
	stream nextPutAll: 'int main(void)';cr.
	stream nextPutAll: '{';cr.
	stream nextPutAll: String tab, 'double t = 0.0;';cr.
	stream nextPutAll: String tab, '//initialize all values of x';cr.
	stream nextPutAll: String tab, 'initializeCompartments();';cr.
	stream nextPutAll: String tab, 'initializeIndividuals();';cr.
	stream nextPutAll: String tab, 'initializeTransitions();';cr.
	stream nextPutAll: String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	stream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'x[i][j] = initialValue[i][j];';cr.
	stream nextPutAll: String tab, 'while (t <= TMAX) {';cr.
	stream nextPutAll: String tab, String tab, 'calculateRate();';cr.
	stream nextPutAll: String tab, String tab, 'for (int i = 0; i < NB_EVENTS; i++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'rates[i] = abs(rates[i]);';cr.
	stream nextPutAll: String tab, String tab, 'for (int i = 0; i < POPULATION_SIZE; i++){';cr.
	stream nextPutAll: String tab, String tab, String tab, 'string currentStatus = listOfIndividuals[i].currentStatus;';cr.
	stream nextPutAll: String tab, String tab, String tab, 'int specieID = listOfIndividuals[i].specieID;';cr.
	stream nextPutAll: String tab, String tab, String tab, 'for (int j = 0; j < NB_EVENTS; j++){';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'if ((listOfTransitions[j].fromStatus.compare(currentStatus)==0)&&(listOfTransitions[j].specieID=specieID)) {';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, String tab, 'double rate = 0.0;';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, String tab, 'double prob = 0.0;';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, String tab, 'rate = rates[j] / getNumberOfIndividuals(currentStatus, specieID);';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, String tab, 'prob = 1 - exp((-1)*STEP*rate);';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, String tab, 'if (prob > (rand()/(double)RAND_MAX))';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, String tab, String tab, 'listOfIndividuals[i].nextStatus = listOfTransitions[j].toStatus;';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, '}';cr.
	stream nextPutAll: String tab, String tab, String tab, '}';cr.
	stream nextPutAll: String tab, String tab, '}';cr.
	stream nextPutAll: String tab, String tab, 'for (int i = 0; i < POPULATION_SIZE; i++){';cr.
	stream nextPutAll: String tab, String tab, String tab, 'if (listOfIndividuals[i].nextStatus.compare("")!=0) {';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'listOfIndividuals[i].currentStatus = listOfIndividuals[i].nextStatus;';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'listOfIndividuals[i].nextStatus = "";';cr.
	stream nextPutAll: String tab, String tab, String tab, '}';cr.
	stream nextPutAll: String tab, String tab, '}';cr.
	stream nextPutAll: String tab, String tab, 'updateNumberOfIndividuals();';cr.
	stream nextPutAll: String tab, String tab, 't += STEP;';cr.
	stream nextPutAll: String tab, String tab, 'cout << t << "  ";';cr.
	stream nextPutAll: String tab, String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'cout <<', function, '(x[i][j]) << "   ";';cr.
	stream nextPutAll: String tab, String tab, 'cout << endl;';cr.
	stream nextPutAll: String tab, '}';cr.
	stream nextPutAll: '}';cr.
	
	stream close.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	