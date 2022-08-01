path_in := Directory("/home/nameless/.gap/pkg/GGraph/doc/");;
SetGAPDocHTMLStyle("toggle");;

main := "GGraph_manual.xml";;
# Put here all the necessary files for compiling the documentatino
files := ["introduction.xml",
          "../lib/comm_graph/comm_graph.gd",
          "../lib/power_graph/power_graph.gd",
          "../lib/inter_graph/inter_graph.gd",
          "../lib/homm_graph/homm_graph.gd",
          "../lib/gen_graph/gen_graph.gd",
          "../lib/LCM_graph/LCM_graph.gd",
          "../lib/prime_graph/prime_graph.gd",
          "../lib/utils/graph_operations.gd" 
           ];;
bookname := "GGraph";;
doc := ComposedDocument("GAPDoc", path_in, main, files, true);;

r := ParseTreeXMLString(doc[1], doc[2]);;
CheckAndCleanGapDocTree(r);

path_out := Directory("/home/nameless/.gap/pkg/GGraph/doc/doc_outputs/");;

# Creates a version with mathjax and another without
h := GAPDoc2HTML(r, path_out, "MathJax");;
GAPDoc2HTMLPrintHTMLFiles(h, path_out);

h := GAPDoc2HTML(r, path_out);;
GAPDoc2HTMLPrintHTMLFiles(h, path_out);
