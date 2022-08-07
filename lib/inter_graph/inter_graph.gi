#############################################################################
##
#F  IntersectionGraph( <Group> ) . . . . . . . . . . . . . . . . . .  
##  . . . . Implements the Intersection Graph of a given group
##
InstallGlobalFunction(IntersectionGraph, function(group)

   local graph, intersect_graph,i,j, h1,h2, A_mx,
         subgroup_list, sbgrp_num, set1, set2;

   if IsGroup(group)=true then 
      subgroup_list := AllSubgroups(group); 
      sbgrp_num := Size(subgroup_list);
      i := 1;
      j := 1;

      # Adjacency Matrix 
      A_mx :=  IdentityMat(sbgrp_num);
      for h1 in subgroup_list do
         j:=1;
         for h2 in subgroup_list do
            # In the intersection graph vertices are subgroups
            # and edges are placed when the intersection of these
            # subgroups is not trivial.
            set1 := Elements(h1);
            set2 := Elements(h2); 
            if  (IntersectionSet(set1,set2) <> [()]) then
               A_mx[i][j] := 1;
            else 
               A_mx[i][j] := 0;
            fi;
            # ignores self loops
            if h1 = h2 then
                A_mx[i][j] := 0;
            fi; 
            j:= j + 1;
         od; 

         i:= i + 1;

      od;   

      graph := Graph(Group(()), [1..sbgrp_num], OnPoints, 
                    function(x,y) return A_mx[x][y]=1; end,
                    true);

      AssignVertexNames(graph, subgroup_list);
      intersect_graph := rec(group:=group, graph := graph);
   else 
      intersect_graph := 0; 
      Error("Input was not a group");
      return fail; 
   fi;
    
   return intersect_graph;
   
   end
);
