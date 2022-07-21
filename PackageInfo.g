SetPackageInfo( rec(
    PackageName := "GGraph",
    Version := "0.0.0",
    Date := "23/07/2022",
    PackageWWWHome :=
    Concatenation( "https://pedrotrin13334.github.io/", LowercaseString( ~.PackageName ) ),

    Subtitle := "GGraph/a Graph Defined on Groups GAP Package",

    SourceRepository := rec(
        Type := "git",
        URL := Concatenation( "https://github.com/pedrotrin13334/", LowercaseString( ~.PackageName ) ),
    ),

    IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
    SupportEmail := "engpedrotrindade@gmail.com",

    PackageDoc := rec(
      BookName  := "GGraph",
      ArchiveURLSubset := ["doc"],
      PDFFile   := "doc/manual.pdf",
      SixFile   := "doc/manual.six",
      HTMLStart := "doc/chap0_mj.html",
      LongTitle := "GGraph/a Graph Defined on Groups Package",
      Autoload  := true ),

    Dependencies := rec(
      GAP       := "4.9",
      NeededOtherPackages := [ ["Grape", "4.8"] ,
                               ["GAPDoc", "1.6"] ],
      SuggestedOtherPackages := [ ],
      ExternalConditions := [ ] ),

    AvailabilityTest := ReturnTrue,   

    Status := "dev",

    AbstractHTML := 
        "The GGraph package, is a package to create, analyze and operate over graphs defined on abstract groups. a GAP package. It allows the construction of many different graphs defined on groups found in the academic literature.",

    README_URL := 
    Concatenation( ~.PackageWWWHome, "/README.md" ),
    PackageInfoURL := 
    Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

Persons := [
  rec( 
    LastName      := "Trindade",
    FirstNames    := "Pedro",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "engpedrotrindade@gmail.com",
    Institution   := "Universidade de Brasília (UnB)"
  ),
  rec( 
    LastName      := "Silva",
    FirstNames    := "Laura",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "marylaura0205@gmail.com",
    Institution   := "Universidade de Brasília (UnB)"
  ),
],

ArchiveFormats := ".tar.gz",
ArchiveURL := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),

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
"\n Author: Pedro Trindade and M. Laura da Silva", "\n\n"
) 
));
