SetPackageInfo( rec(
  PackageName := "GGraph",
  Version := "1.0",
  PackageDoc := rec(
      BookName  := "GGraph",
      SixFile   := "doc/manual.six",
      Autoload  := true ),
  Dependencies := rec(
      GAP       := "4.9",
      NeededOtherPackages := [ ["GAPDoc", "1.6"] ],
      SuggestedOtherPackages := [ ] ),
  AvailabilityTest := ReturnTrue ) );
