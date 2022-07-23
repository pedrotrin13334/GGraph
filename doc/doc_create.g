path_in := Directory("/home/nameless/.gap/pkg/GGraph/doc/");;
SetGAPDocHTMLStyle("toggless");;
main := "GGraph_manual.xml";;
# Put here all the necessary files for compiling the documentatino
files := ["introduction.xml"];;
bookname := "GGraph";;
doc := ComposedDocument("GAPDoc", path_in, main, files, true);;

r := ParseTreeXMLString(doc[1], doc[2]);;
CheckAndCleanGapDocTree(r);

path_out := Directory("/home/nameless/.gap/pkg/GGraph/doc/doc_output/");;
h := GAPDoc2HTML(r, path_out);;
GAPDoc2HTMLPrintHTMLFiles(h, path_out);;
