InstallGlobalFunction(LCMGraph, function(group)
   local graph, lcm_graph,i,j, e1,e2, A_mx, g_order, lc_gen, elm_sum, lcm_group;
   # Generators of the LC group
   lc_gen := [];
   # element sum of times it satisfies the LCM condition
   elm_sum := 0;
   if IsGroup(group)=true then 
      g_order := Order(group);
      i := 1;
      j := 1;
      # Adjacency Matrix 
      A_mx :=  IdentityMat(g_order);
      for e1 in Elements(group) do
         j:=1;
         elm_sum := 0;
         for e2 in Elements(group) do
            # Tests LCM graph condition for edge connecting
            if RemInt(LcmInt(Order(e1),Order(e2)), Order(e1*e2)) = 0 then
               A_mx[i][j] := 1;
	       elm_sum := elm_sum +1;
            else 
               A_mx[i][j] := 0;
            fi;
            j:= j + 1;
         od; 

         i:= i + 1;

	if elm_sum = g_order then
	   Append(lc_gen, [e1]); 
        fi;

      od;   

      lcm_group := Group(lc_gen);
      graph := Graph(Group(()), [1..g_order], OnPoints, 
                    function(x,y) return A_mx[x][y]=1; end,
   			 true);
      lcm_graph := rec(group:=group, graph := graph, lcmGroup := lcm_group);
   else 
      lcm_graph := 0; 
      Display("Input was not a group");
   fi;
	
   return lcm_graph;
   
   end
);
