# This code is just to read the csv from the python code
# output and get the structure description of a few groups

filename := "ischordal_power_graphs.csv";
#filename := "ischordal_pwgraphs_di.csv";
grp_list := ReadCSV(filename,";");

chordal_list := [];

for grp in grp_list do
    if EvalString(LowercaseString(grp.is_chordal))=true then
       Add(chordal_list, SmallGroup(EvalString(grp.grp_idx))); 
    fi;
od; 

struct_descriptions := List(chordal_list,
                            x->StructureDescription(x));

Display(struct_descriptions{[1..70]});
