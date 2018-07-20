"
A KECPPStochasticVisitor is a visitor that generates the code C/C++ for the model using the stochastic simulation.

"
Class {
	#name : #KECPPStochasticVisitor,
	#superclass : #KECPPVisitor,
	#category : #'Kendrick-Obsolete-Code-Generators'
}

{ #category : #'as yet unclassified' }
KECPPStochasticVisitor >> acceptKEModel: aNode [
	|working fileName|
	
	numberOfEvent :=0.		
	"Get the name of the model as the name of cpp file"
	fileName := self getFileName: aNode.
	"Initialize a file in which all code cpp generated will be saved"
	working := FileSystem disk workingDirectory.
	stream := (working / fileName) writeStream.
	"Traverse the model and visit each node"
	self prepareCPPFile.
	isDeterministic := false.
	"define some global variables"		
	stream nextPutAll: 'const double TMAX = ', aNode simulator tMax asFloat asString, ';';cr.
	stream nextPutAll: 'const double TMIN = ', aNode simulator tMin asFloat asString, ';';cr.
	stream nextPutAll: 'const double STEP = ', aNode simulator step asFloat asString, ';';cr.
	stream nextPutAll: 'const int NB_EVENTS = ' , (aNode eventList  size) asString, ';';cr;cr.
	
	stream nextPutAll: 'const int nbOfCompartments = ', aNode numberOfCompartments asString, ';';cr.
	stream nextPutAll: 'const int nbOfSpecies = ', aNode numberOfSpecies asString, ';';cr;cr.
	
	stream nextPutAll: 'double t = TMIN;';cr.
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
	stream nextPutAll: 'double sum(double a[], int n) {';cr.
	stream nextPutAll: String tab, 'double s=0.0;';cr.
	stream nextPutAll: String tab, 'for (int i=0; i < n; i++)';cr.
	stream nextPutAll: String tab, String tab, 's += a[i];';cr.
	stream nextPutAll: String tab, 'return s;';cr.
	stream nextPutAll: '}';cr.
	
	"choose action"
	stream nextPutAll: 'int selectEvent(double sumOfRates, double r) {';cr.
	stream nextPutAll: String tab, 'int event = -1;';cr.
	stream nextPutAll: String tab, 'double sp = 0.0;';cr.
	stream nextPutAll: String tab, 'double p = 0.0;';cr.
	stream nextPutAll: String tab, 'p = r * sumOfRates;';cr.
	stream nextPutAll: String tab, 'for (int i = 0; i < NB_EVENTS; i++) {';cr.
	stream nextPutAll: String tab, String tab,'sp += rates[i];';cr.
	stream nextPutAll: String tab, String tab,'if (p <= sp) {';cr.
	stream nextPutAll: String tab, String tab, String tab,'event = i;';cr.
	stream nextPutAll: String tab, String tab, String tab,'break;';cr.
	stream nextPutAll: String tab, String tab,'}';cr.
	stream nextPutAll: String tab, '}';cr.
	stream nextPutAll: String tab, 'return event;';cr.
	stream nextPutAll: '}';cr.	
	
	"visit all actions of events"
	strInitializeTrans nextPutAll: 'void Transition(int pEvent)';cr.
	strInitializeTrans nextPutAll: '{';cr.
	strInitializeTrans nextPutAll: String tab, 'switch(pEvent) {';cr.
	        
	"visit all events"
	stream nextPutAll: 'void calculateRate()';cr.
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
	stream nextPutAll: 'int main(int argc, char *argv[]){';cr.
	stream nextPutAll: String tab, 'double sumOfRates = 0.0;';cr.	
	stream nextPutAll: String tab, 'double previousTime = TMIN;';cr.
	stream nextPutAll: String tab, 'double r1 = 0.0;';cr.
	stream nextPutAll: String tab, 'double r2 = 0.0;';cr.
	stream nextPutAll: String tab, 'int event = -1;';cr.
	stream nextPutAll: String tab, 'double tOffset = 0.0;';cr.
				
	"init value"
	stream nextPutAll: String tab, '//Initialize all values of x';cr.
	stream nextPutAll: String tab, 'initializeCompartments();';cr.
	stream nextPutAll: String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	stream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	stream nextPutAll: String tab, String tab, String tab, 'x[i][j] = initialValue[i][j];';cr.	
	stream nextPutAll: String tab, '//prepare file for saving data';cr.
	stream nextPutAll: String tab, 'stringstream fname;';cr.
	stream nextPutAll: String tab, 'fname << "data_";';cr.
	stream nextPutAll: String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	stream nextPutAll: String tab, String tab, 'fname << compartmentName[i];';cr.
	stream nextPutAll: String tab, 'fname << "_stc.dat";';cr.
	stream nextPutAll: String tab, 'ofstream f(fname.str().data());';cr.
	stream nextPutAll: String tab, 'cout << "Starting..." << endl;';cr.	
	stream nextPutAll: String tab, 'srand(time(0));';cr.
	stream nextPutAll: String tab, '//Begin of algorithm Gillespie';cr.
	stream nextPutAll: String tab, 'if (f.is_open())';cr.
	stream nextPutAll: String tab, '{';cr.	
	stream nextPutAll: String tab, String tab, 'while (t < TMAX) {';cr.
	stream nextPutAll: String tab, String tab, String tab, '//calculation of rates';cr.
	stream nextPutAll: String tab, String tab, String tab, 'calculateRate();';cr.
	stream nextPutAll: String tab, String tab, String tab, 'for (int i = 0; i < NB_EVENTS; i++)';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'if (rates[i] < 0)';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, String tab, 'rates[i] = rates[i]*(-1);';cr.
	stream nextPutAll: String tab, String tab, String tab, '//Sum of rates';cr.
	stream nextPutAll: String tab, String tab, String tab, 'sumOfRates = sum(rates, NB_EVENTS);';cr.
	stream nextPutAll: String tab, String tab, String tab, '//Generation of time for the next calculation';cr.	
	stream nextPutAll: String tab, String tab, String tab, 'r1 = (double)rand()/RAND_MAX;';cr.
	stream nextPutAll: String tab, String tab, String tab, 'r2 = (double)rand()/RAND_MAX;';cr.
	stream nextPutAll: String tab, String tab, String tab, 'tOffset = (-1/sumOfRates)*log(r1);';cr.
	stream nextPutAll: String tab, String tab, String tab, '//select event';cr.
	stream nextPutAll: String tab, String tab, String tab, 'event = selectEvent(sumOfRates, r2);';cr.
	stream nextPutAll: String tab, String tab, String tab, 'Transition(event);';cr.
	stream nextPutAll: String tab, String tab, String tab, 'if (t > (previousTime + STEP)){';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'f << t << ''\t'';';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, String tab, String tab, 'f << ', function asString, '(x[i][j]) << ''\t'';';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'f << ''\n'';';cr.
	stream nextPutAll: String tab, String tab, String tab, String tab, 'previousTime = t;';cr.
	stream nextPutAll: String tab, String tab, String tab, '}';cr.	
	stream nextPutAll: String tab, String tab, String tab, 't += tOffset;';cr.
	stream nextPutAll: String tab, String tab, '}';cr.
	stream nextPutAll: String tab, String tab, 'f.close();';cr.
	stream nextPutAll: String tab, '}';cr.
	stream nextPutAll: String tab, 'cout << "Finished..." << endl;';cr.
      "end of main function"				
	stream nextPutAll: '}';cr.
	
	"Enregistrer le fichier"
	stream close.
]

{ #category : #'as yet unclassified' }
KECPPStochasticVisitor >> prepareCPPFile [
	stream nextPutAll: '//stochastic model';cr.
	stream nextPutAll: '#include <iostream>';cr.
	stream nextPutAll: '#include <string>';cr.
	stream nextPutAll: '#include <stdio.h>';cr.
	stream nextPutAll: '#include <stdlib.h>';cr.
	stream nextPutAll: '#include <math.h>';cr.
	stream nextPutAll: '#include <time.h>';cr.
	stream nextPutAll: '#include <fstream>';cr.
	stream nextPutAll: '#include <sstream>';cr;cr.	
		
	stream nextPutAll: 'using namespace std;';cr;cr.

	
	
	



]
