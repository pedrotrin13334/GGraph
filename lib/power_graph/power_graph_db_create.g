# This code generates a database of
# power graphs for later analysis

LoadPackage("GGraph");

# split the abelian case from
# the non abelian case 
max_order_ab := 200;
max_order_nab := 300;
max_order_list := [max_order_nab, max_order_ab];

# This is the maximum size of the adjacency list
# until saved in a separated file
max_adj_list_sz := 110;

dir := "./power_graph_database/";
file_name2 := Concatenation(dir,"power_graphs_nabelian.csv");
file_name1 := Concatenation(dir,"power_graphs_abelian.csv");

file_name_list := [file_name1, file_name2];;
# conditions for the type of group to partition the files into
conditions := [x-> IsAbelian(x), x-> not IsAbelian(x)];;

for idx in [1..Size(file_name_list)] do

PrintTo(file_name_list[idx], "grp_idx;power_graph;#\n");

    for ord in [1..max_order_list[idx]] do
        groups := AllSmallGroups(ord, conditions[idx]);

        for grp in groups do
            
            grp_id := IdSmallGroup(grp); 
            Display(grp_id);
     
            pg := PowerGraph(grp);
            
            adj_list := []; 
            for vertex in Vertices(pg.graph) do 
                adj := []; 
                Add(adj, vertex); 
                adj := Concatenation(adj, Adjacency(pg.graph,
                                                    vertex)); 
                Add(adj_list, adj); 
            od;

            # If size larger than max, add to a separate file 
            if Size(adj_list) > max_adj_list_sz then
                new_file := Concatenation(String(grp_id),
                                          "_pwgraph.csv");

                dir_file := Concatenation(dir,
                                          new_file); 
                PrintTo(dir_file, adj_list);  
                adj_list := new_file; 
            fi;

            #  This hashtags in the files are necessary
            #  for formatting the csv file given 
            #  the limitations in the CSVRead 
            #  functionality for large lists. 
            AppendTo(file_name_list[idx], 
                     grp_id, ";", adj_list, ";#"); 
        od;
    od;
od;

