 Gofer new
    url: 'http://ss3.gemstone.com/ss/FileTree';
    package: 'ConfigurationOfFileTree';
    load.
  ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.
Gofer new
    repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/home/vagrant/builds/SergeStinckwich/Kendrick/'));
    package: 'Kendrick';
    load.
HDTestReport runPackages: #(
             'Kendrick-Tests-ExternalDSL'
             'Kendrick-Tests-SemanticModel').