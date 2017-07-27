as yet unclassified
acceptKEModel: arg1
	| tmp1 tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 tmp14 tmp16 tmp18 tmp20 tmp22 tmp24 tmp26 tmp28 tmp30 tmp32 tmp34 tmp36 tmp38 tmp40 tmp42 |
	tmp2 := self getFileName: arg1.
	tmp1 := FileSystem disk workingDirectory.
	stream := (tmp1 / tmp2) writeStream.
	isDeterministic := true.
	self prepareCPPFile.
	tmp4 := stream.
	tmp4
		nextPutAll:
			'const int nbOfCompartments = ' , arg1 compartments size asString
				, ';';
		cr.
	tmp6 := stream.
	tmp6
		nextPutAll: 'const int nbOfSpecies = ' , arg1 numberOfSpecies asString , ';';
		cr.
	tmp8 := stream.
	tmp8
		nextPutAll: 'const double tMin = ' , arg1 simulator tMin asFloat asString , ';';
		cr.
	tmp10 := stream.
	tmp10
		nextPutAll: 'const double tMax = ' , arg1 simulator tMax asFloat asString , ';';
		cr.
	tmp12 := stream.
	tmp12
		nextPutAll: 'const double tStep = ' , arg1 simulator step asFloat asString , ';';
		cr;
		cr.
	tmp14 := stream.
	tmp14
		nextPutAll: 'double initialValue[nbOfCompartments][nbOfSpecies];';
		cr.
	tmp16 := stream.
	tmp16
		nextPutAll: 'string compartmentName[nbOfCompartments];';
		cr.
	tmp18 := stream.
	tmp18
		nextPutAll: 'void initializeCompartments()';
		cr.
	tmp20 := stream.
	tmp20
		nextPutAll: '{';
		cr.
	arg1 compartments
		do: [ :arg2 | stream nextPutAll: (self visitNode: arg2) ].
	tmp22 := stream.
	tmp22
		nextPutAll: '}';
		cr.
	arg1 parameters
		do: [ :arg3 | stream nextPutAll: (self visitNode: arg3) ].
	tmp24 := stream.
	tmp24
		nextPutAll: 'void initializeEquations(const state_type &x, state_type &dxdt, double t)';
		cr.
	tmp26 := stream.
	tmp26
		nextPutAll: '{';
		cr.
	arg1 equations
		do: [ :arg4 | stream nextPutAll: (self visitNode: arg4) ].
	tmp28 := stream.
	tmp28
		nextPutAll: '}';
		cr;
		cr.
	stream nextPutAll: (self visitNode: arg1 simulator).
	tmp30 := stream.
	tmp30
		nextPutAll: 'int main(int argc, char **argv)';
		cr.
	tmp32 := stream.
	tmp32
		nextPutAll: '{';
		cr.
	tmp34 := stream.
	tmp34
		nextPutAll: String tab , 'cout << "Start..." << endl;';
		cr.
	tmp36 := stream.
	tmp36
		nextPutAll: String tab , 'initializeCompartments();';
		cr.
	tmp38 := stream.
	tmp38
		nextPutAll: String tab , 'solverDeterministic();';
		cr.
	tmp40 := stream.
	tmp40
		nextPutAll: String tab , 'cout << "Finished..." << endl;';
		cr.
	tmp42 := stream.
	tmp42
		nextPutAll: '}';
		cr.
	stream close