as yet unclassified
acceptKEModel: arg1
	| tmp1 tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 tmp14 tmp16 tmp18 tmp20 tmp22 tmp24 tmp26 tmp28 tmp30 tmp32 tmp34 tmp36 tmp38 tmp40 tmp42 tmp44 tmp46 tmp48 tmp50 tmp52 tmp54 tmp56 tmp58 tmp60 tmp62 tmp64 tmp66 tmp68 tmp70 tmp72 tmp74 tmp76 tmp78 tmp80 tmp82 tmp84 tmp86 tmp88 tmp90 tmp92 tmp94 tmp96 tmp98 tmp100 tmp102 tmp104 tmp106 tmp108 tmp110 tmp112 tmp114 tmp116 tmp118 tmp120 tmp122 tmp124 tmp126 tmp128 tmp130 tmp132 tmp134 tmp136 tmp138 tmp140 tmp142 tmp144 tmp146 tmp148 tmp150 tmp152 tmp154 tmp156 tmp158 tmp160 tmp162 tmp164 tmp166 tmp168 tmp170 tmp172 tmp174 tmp176 tmp178 tmp180 tmp182 tmp184 tmp186 tmp188 tmp190 tmp192 tmp194 tmp196 tmp198 tmp200 tmp202 tmp204 tmp206 tmp208 tmp210 tmp212 tmp214 tmp216 tmp218 tmp220 tmp222 tmp224 tmp226 tmp228 tmp230 tmp232 tmp234 tmp236 tmp238 tmp240 tmp242 tmp244 tmp246 tmp248 tmp250 tmp252 tmp254 tmp256 tmp258 tmp260 tmp262 tmp264 tmp266 tmp268 tmp270 tmp272 tmp274 |
	tmp2 := self getFileName: arg1.
	tmp1 := FileSystem disk workingDirectory.
	stream := (tmp1 / tmp2) writeStream.
	isDeterministic := false.
	self prepareCPPFile.
	tmp4 := stream.
	tmp4
		nextPutAll: 'const double TMAX = ' , arg1 simulator tMax asFloat asString , ';';
		cr.
	tmp6 := stream.
	tmp6
		nextPutAll: 'const double TMIN = ' , arg1 simulator tMin asFloat asString , ';';
		cr.
	tmp8 := stream.
	tmp8
		nextPutAll: 'const double STEP = ' , arg1 simulator step asFloat asString , ';';
		cr.
	tmp10 := stream.
	tmp10
		nextPutAll:
			'const int NB_EVENTS = '
				, arg1 simulator listOfTransitions size asString , ';';
		cr;
		cr.
	tmp12 := stream.
	tmp12
		nextPutAll:
			'const int nbOfCompartments = ' , arg1 numberOfCompartments asString
				, ';';
		cr.
	tmp14 := stream.
	tmp14
		nextPutAll: 'const int nbOfSpecies = ' , arg1 numberOfSpecies asString , ';';
		cr;
		cr.
	tmp16 := stream.
	tmp16
		nextPutAll: 'double t = TMIN;';
		cr.
	tmp18 := stream.
	tmp18
		nextPutAll: 'double initialValue[nbOfCompartments][nbOfSpecies];';
		cr.
	tmp20 := stream.
	tmp20
		nextPutAll: 'string compartmentName[nbOfCompartments];';
		cr.
	tmp22 := stream.
	tmp22
		nextPutAll: 'double x[nbOfCompartments][nbOfSpecies];';
		cr.
	tmp24 := stream.
	tmp24
		nextPutAll: 'double rates[NB_EVENTS];';
		cr;
		cr.
	tmp26 := stream.
	tmp26
		nextPutAll: 'struct KEIndividual {';
		cr.
	tmp28 := stream.
	tmp28
		nextPutAll: String tab , 'string currentStatus;';
		cr.
	tmp30 := stream.
	tmp30
		nextPutAll: String tab , 'string nextStatus;';
		cr.
	tmp32 := stream.
	tmp32
		nextPutAll: String tab , 'int specieID;';
		cr.
	tmp34 := stream.
	tmp34
		nextPutAll: '};';
		cr;
		cr.
	tmp36 := stream.
	tmp36
		nextPutAll: 'vector<KEIndividual> listOfIndividuals;';
		cr;
		cr.
	tmp38 := stream.
	tmp38
		nextPutAll: 'struct KETransition {';
		cr.
	tmp40 := stream.
	tmp40
		nextPutAll: String tab , 'string fromStatus;';
		cr.
	tmp42 := stream.
	tmp42
		nextPutAll: String tab , 'string toStatus;';
		cr.
	tmp44 := stream.
	tmp44
		nextPutAll: String tab , 'int specieID;';
		cr.
	tmp46 := stream.
	tmp46
		nextPutAll: '} listOfTransitions[NB_EVENTS];';
		cr;
		cr.
	arg1 parameters
		do: [ :arg2 | stream nextPutAll: (self visitNode: arg2) ].
	tmp48 := stream.
	tmp48
		nextPutAll: 'void initializeCompartments()';
		cr.
	tmp50 := stream.
	tmp50
		nextPutAll: '{';
		cr.
	arg1 compartments
		do: [ :arg3 | stream nextPutAll: (self visitNode: arg3) ].
	tmp52 := stream.
	tmp52
		nextPutAll: '}';
		cr;
		cr.
	tmp54 := stream.
	tmp54
		nextPutAll: 'void initializeIndividuals()';
		cr.
	tmp56 := stream.
	tmp56
		nextPutAll: '{';
		cr.
	tmp58 := stream.
	tmp58
		nextPutAll: String tab , 'for (int i = 0; i < nbOfCompartments; i++){';
		cr.
	tmp60 := stream.
	tmp60
		nextPutAll: String tab , String tab , 'for (int j = 0; j < nbOfSpecies; j++){';
		cr.
	tmp62 := stream.
	tmp62
		nextPutAll:
			String tab , String tab , String tab
				, 'for (int k = 0; k < initialValue[i][j]; k++){';
		cr.
	tmp64 := stream.
	tmp64
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'KEIndividual individual;';
		cr.
	tmp66 := stream.
	tmp66
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'individual.currentStatus = compartmentName[i];';
		cr.
	tmp68 := stream.
	tmp68
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'individual.nextStatus = compartmentName[i];';
		cr.
	tmp70 := stream.
	tmp70
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'individual.specieID = j + 1;';
		cr.
	tmp72 := stream.
	tmp72
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'listOfIndividuals.push_back(individual);';
		cr.
	tmp74 := stream.
	tmp74
		nextPutAll: String tab , String tab , String tab , '}';
		cr.
	tmp76 := stream.
	tmp76
		nextPutAll: String tab , String tab , '}';
		cr.
	tmp78 := stream.
	tmp78
		nextPutAll: String tab , '}';
		cr.
	tmp80 := stream.
	tmp80
		nextPutAll: '}';
		cr;
		cr.
	tmp82 := stream.
	tmp82
		nextPutAll: 'double getNumberOfIndividuals(string currentStatus, int specieID)';
		cr.
	tmp84 := stream.
	tmp84
		nextPutAll: '{';
		cr.
	tmp86 := stream.
	tmp86
		nextPutAll: String tab , 'for (int i = 0; i < nbOfCompartments; i++)';
		cr.
	tmp88 := stream.
	tmp88
		nextPutAll:
			String tab , String tab
				, 'if (compartmentName[i].compare(currentStatus)==0)';
		cr.
	tmp90 := stream.
	tmp90
		nextPutAll: String tab , String tab , String tab , 'return x[i][specieID-1];';
		cr.
	tmp92 := stream.
	tmp92
		nextPutAll: String tab , 'return 0;';
		cr.
	tmp94 := stream.
	tmp94
		nextPutAll: '}';
		cr;
		cr.
	tmp96 := stream.
	tmp96
		nextPutAll: 'void updateNumberOfIndividuals()';
		cr.
	tmp98 := stream.
	tmp98
		nextPutAll: '{';
		cr.
	tmp100 := stream.
	tmp100
		nextPutAll: String tab , 'for (int i = 0; i < nbOfCompartments; i++)';
		cr.
	tmp102 := stream.
	tmp102
		nextPutAll: String tab , String tab , 'for (int j = 0; j < nbOfSpecies; j++)';
		cr.
	tmp104 := stream.
	tmp104
		nextPutAll: String tab , String tab , String tab , 'x[i][j] = 0;';
		cr.
	tmp106 := stream.
	tmp106
		nextPutAll: String tab , 'int populationSize = listOfIndividuals.size();';
		cr.
	tmp108 := stream.
	tmp108
		nextPutAll: String tab , 'for (int i = 0; i < populationSize; i++){';
		cr.
	tmp110 := stream.
	tmp110
		nextPutAll: String tab , String tab , 'for (int j = 0; j < nbOfCompartments; j++)';
		cr.
	tmp112 := stream.
	tmp112
		nextPutAll:
			String tab , String tab , String tab
				, 'if (compartmentName[j].compare(listOfIndividuals[i].currentStatus)==0)';
		cr.
	tmp114 := stream.
	tmp114
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'x[j][listOfIndividuals[i].specieID-1] += 1;';
		cr.
	tmp116 := stream.
	tmp116
		nextPutAll: String tab , '}';
		cr.
	tmp118 := stream.
	tmp118
		nextPutAll: '}';
		cr;
		cr.
	numberOfEvent := 0.
	tmp120 := strInitializeTrans.
	tmp120
		nextPutAll: 'void initializeTransitions()';
		cr.
	tmp122 := strInitializeTrans.
	tmp122
		nextPutAll: '{';
		cr.
	tmp124 := stream.
	tmp124
		nextPutAll: 'void calculateRate()';
		cr.
	tmp126 := stream.
	tmp126
		nextPutAll: '{';
		cr.
	arg1 simulator listOfTransitions
		do: [ :arg4 | stream nextPutAll: (self visitNode: arg4) ].
	tmp128 := stream.
	tmp128
		nextPutAll: '}';
		cr;
		cr.
	tmp130 := strInitializeTrans.
	tmp130
		nextPutAll: '}';
		cr;
		cr.
	stream nextPutAll: strInitializeTrans contents.
	tmp132 := stream.
	tmp132
		nextPutAll: 'int main(void)';
		cr.
	tmp134 := stream.
	tmp134
		nextPutAll: '{';
		cr.
	tmp136 := stream.
	tmp136
		nextPutAll: String tab , '//initialize all values of x';
		cr.
	tmp138 := stream.
	tmp138
		nextPutAll: String tab , 'initializeCompartments();';
		cr.
	tmp140 := stream.
	tmp140
		nextPutAll: String tab , 'initializeIndividuals();';
		cr.
	tmp142 := stream.
	tmp142
		nextPutAll: String tab , 'initializeTransitions();';
		cr.
	tmp144 := stream.
	tmp144
		nextPutAll: String tab , 'for (int i = 0; i < nbOfCompartments; i++)';
		cr.
	tmp146 := stream.
	tmp146
		nextPutAll: String tab , String tab , 'for (int j = 0; j < nbOfSpecies; j++)';
		cr.
	tmp148 := stream.
	tmp148
		nextPutAll: String tab , String tab , String tab , 'x[i][j] = initialValue[i][j];';
		cr.
	tmp150 := stream.
	tmp150
		nextPutAll: String tab , '//prepare file for saving data';
		cr.
	tmp152 := stream.
	tmp152
		nextPutAll: String tab , 'stringstream fname;';
		cr.
	tmp154 := stream.
	tmp154
		nextPutAll: String tab , 'fname << "data_";';
		cr.
	tmp156 := stream.
	tmp156
		nextPutAll: String tab , 'for (int i = 0; i < nbOfCompartments; i++)';
		cr.
	tmp158 := stream.
	tmp158
		nextPutAll: String tab , String tab , 'fname << compartmentName[i];';
		cr.
	tmp160 := stream.
	tmp160
		nextPutAll: String tab , 'fname << "_ibm.dat";';
		cr.
	tmp162 := stream.
	tmp162
		nextPutAll: String tab , 'ofstream f(fname.str().data());';
		cr.
	tmp164 := stream.
	tmp164
		nextPutAll: String tab , 'cout << "Starting..." << endl;';
		cr.
	tmp166 := stream.
	tmp166
		nextPutAll: String tab , 'srand(time(0));';
		cr.
	tmp168 := stream.
	tmp168
		nextPutAll: String tab , 'if (f.is_open())';
		cr.
	tmp170 := stream.
	tmp170
		nextPutAll: String tab , '{';
		cr.
	tmp172 := stream.
	tmp172
		nextPutAll: String tab , String tab , 'while (t <= TMAX) {';
		cr.
	tmp174 := stream.
	tmp174
		nextPutAll: String tab , String tab , String tab , 'calculateRate();';
		cr.
	tmp176 := stream.
	tmp176
		nextPutAll:
			String tab , String tab , String tab
				, 'for (int i = 0; i < NB_EVENTS; i++)';
		cr.
	tmp178 := stream.
	tmp178
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'if (rates[i] < 0)';
		cr.
	tmp180 := stream.
	tmp180
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'rates[i] = rates[i]*(-1);';
		cr.
	tmp182 := stream.
	tmp182
		nextPutAll:
			String tab , String tab , String tab
				, 'int populationSize = listOfIndividuals.size();';
		cr.
	tmp184 := stream.
	tmp184
		nextPutAll:
			String tab , String tab , String tab
				, 'for (int i = 0; i < populationSize; i++){';
		cr.
	tmp186 := stream.
	tmp186
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'string currentStatus = listOfIndividuals[i].currentStatus;';
		cr.
	tmp188 := stream.
	tmp188
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'int specieID = listOfIndividuals[i].specieID;';
		cr.
	tmp190 := stream.
	tmp190
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'for (int j = 0; j < NB_EVENTS; j++){';
		cr.
	tmp192 := stream.
	tmp192
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'double rate = 0.0;';
		cr.
	tmp194 := stream.
	tmp194
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'double prob = 0.0;';
		cr.
	tmp196 := stream.
	tmp196
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'double r = 0.0;';
		cr.
	tmp198 := stream.
	tmp198
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'rate = rates[j] / getNumberOfIndividuals(currentStatus, specieID);';
		cr.
	tmp200 := stream.
	tmp200
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'prob = 1 - exp((-1)*STEP*rate);';
		cr.
	tmp202 := stream.
	tmp202
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'r = (double)rand()/RAND_MAX;';
		cr.
	tmp204 := stream.
	tmp204
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'if ((listOfTransitions[j].fromStatus.compare(currentStatus)==0)&&(listOfTransitions[j].specieID=specieID)) {';
		cr.
	tmp206 := stream.
	tmp206
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab , 'if (prob > r)';
		cr.
	tmp208 := stream.
	tmp208
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab , String tab
				, 'listOfIndividuals[i].nextStatus = listOfTransitions[j].toStatus;';
		cr.
	tmp210 := stream.
	tmp210
		nextPutAll: String tab , String tab , String tab , String tab , String tab , '}';
		cr.
	tmp212 := stream.
	tmp212
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'if ((listOfTransitions[j].fromStatus.compare("")==0)&&(listOfTransitions[j].toStatus.compare(currentStatus)==0)&&(listOfTransitions[j].specieID=specieID)){';
		cr.
	tmp214 := stream.
	tmp214
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab , 'if (prob > r) {';
		cr.
	tmp216 := stream.
	tmp216
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab , String tab , 'KEIndividual individual;';
		cr.
	tmp218 := stream.
	tmp218
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab , String tab
				, 'individual.currentStatus = currentStatus;';
		cr.
	tmp220 := stream.
	tmp220
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab , String tab
				, 'individual.nextStatus = currentStatus;';
		cr.
	tmp222 := stream.
	tmp222
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab , String tab , 'individual.specieID = specieID;';
		cr.
	tmp224 := stream.
	tmp224
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab , String tab
				, 'listOfIndividuals.push_back(individual);';
		cr.
	tmp226 := stream.
	tmp226
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab , '}';
		cr.
	tmp228 := stream.
	tmp228
		nextPutAll: String tab , String tab , String tab , String tab , String tab , '}';
		cr.
	tmp230 := stream.
	tmp230
		nextPutAll: String tab , String tab , String tab , String tab , '}';
		cr.
	tmp232 := stream.
	tmp232
		nextPutAll: String tab , String tab , String tab , '}';
		cr.
	tmp234 := stream.
	tmp234
		nextPutAll:
			String tab , String tab , String tab
				, 'for (int i = 0; i < populationSize; i++){';
		cr.
	tmp236 := stream.
	tmp236
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'string currentStatus = listOfIndividuals[i].currentStatus;';
		cr.
	tmp238 := stream.
	tmp238
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'if (listOfIndividuals[i].nextStatus.compare(currentStatus)!=0) {';
		cr.
	tmp240 := stream.
	tmp240
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'if (listOfIndividuals[i].nextStatus.compare("")==0)';
		cr.
	tmp242 := stream.
	tmp242
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab
				, 'listOfIndividuals.erase(listOfIndividuals.begin()+i);';
		cr.
	tmp244 := stream.
	tmp244
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'else';
		cr.
	tmp246 := stream.
	tmp246
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab
				, 'listOfIndividuals[i].currentStatus = listOfIndividuals[i].nextStatus;';
		cr.
	tmp248 := stream.
	tmp248
		nextPutAll: String tab , String tab , String tab , String tab , '}';
		cr.
	tmp250 := stream.
	tmp250
		nextPutAll: String tab , String tab , String tab , '}';
		cr.
	tmp252 := stream.
	tmp252
		nextPutAll: String tab , String tab , String tab , 'updateNumberOfIndividuals();';
		cr.
	tmp254 := stream.
	tmp254
		nextPutAll: String tab , String tab , String tab , 'f << t << ''\t'';';
		cr.
	tmp256 := stream.
	tmp256
		nextPutAll: String tab , String tab , String tab , 't += STEP;';
		cr.
	tmp258 := stream.
	tmp258
		nextPutAll:
			String tab , String tab , String tab
				, 'for (int i = 0; i < nbOfCompartments; i++)';
		cr.
	tmp260 := stream.
	tmp260
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'for (int j = 0; j < nbOfSpecies; j++)';
		cr.
	tmp262 := stream.
	tmp262
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'f << ' , function asString , '(x[i][j]) << ''\t'';';
		cr.
	tmp264 := stream.
	tmp264
		nextPutAll: String tab , String tab , String tab , 'f << ''\n'';';
		cr.
	tmp266 := stream.
	tmp266
		nextPutAll: String tab , String tab , '}';
		cr.
	tmp268 := stream.
	tmp268
		nextPutAll: String tab , String tab , 'f.close();';
		cr.
	tmp270 := stream.
	tmp270
		nextPutAll: String tab , '}';
		cr.
	tmp272 := stream.
	tmp272
		nextPutAll: String tab , 'cout << "Finished..." << endl;';
		cr.
	tmp274 := stream.
	tmp274
		nextPutAll: '}';
		cr.
	stream close