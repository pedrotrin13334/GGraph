## This is a script that run all the test files in this directory. 

LoadPackage("GGraph");

TestDirectory(DirectoriesPackageLibrary( "GGraph", "tst" ),
  rec(exitGAP     := true,
      testOptions := rec(compareFunction := "uptowhitespace") ) );

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
