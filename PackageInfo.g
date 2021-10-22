SetPackageInfo( rec(
  PackageName := "GGraph",
  Version := "1.0",
  PackageDoc := rec(
      BookName  := "GGraph",
      SixFile   := "doc/manual.six",
      Autoload  := true ),
  Dependencies := rec(
      GAP       := "4.9",
      NeededOtherPackages := [ ["Grape","GAPDoc", "1.6"] ],
      SuggestedOtherPackages := [ ] ),
  AvailabilityTest := ReturnTrue,   

# This is a string that is shown as the banner when the package is loaded,
# the \ must be \\ for this to work
BannerString:= Concatenation(
"\n    ___       ___       ___       ___       ___       ___   ", 
"\n   /\\  \\     /\\  \\     /\\  \\     /\\  \\     /\\  \\     /\\__\\  ",
"\n  /  \\  \\   /  \\  \\   /  \\  \\   /  \\  \\   /  \\  \\   / /__/_ ",
"\n / /\\ \\__\\ / /\\ \\__\\ /  \\ \\__\\ /  \\ \\__\\ /  \\ \\__\\ /  \\/\\__\\ ",
"\n \\ \\ \\/__/ \\ \\ \\/__/ \\    /  / \\/\\  /  / \\/\\  /  / \\/\\  /  / ",
"\n  \\  /  /   \\  /  /   \\ \\/__/    / /  /     \\/__/    / /  / ",
"\n   \\/__/     \\/__/     \\|__|     \\/__/               \\/__/ ", 
"\n Graphs defined on groups algorithms",
"\n Author: Pedro Trindade", "\n\n"
) 
));
