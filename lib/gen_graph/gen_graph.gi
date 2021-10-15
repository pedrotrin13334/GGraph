InstallGlobalFunction(GenGraph, function(group)
   local graph, gen_graph,i,j, e1,e2, A_mx, g_order;

   if IsGroup(group)=true then 
      g_order := Order(group);
      i := 1;
      j := 1;
      # Adjacency Matrix 
      A_mx :=  IdentityMat(g_order);
      for e1 in Elements(group) do
         j:=1;
         for e2 in Elements(group) do
            # Tests Generating graph condition for edge connecting
            if  Group([e1,e2]) = group then
               A_mx[i][j] := 1;
            else 
               A_mx[i][j] := 0;
            fi;
            j:= j + 1;
         od; 

         i:= i + 1;

      od;   

      graph := Graph(Group(()), [1..g_order], OnPoints, 
                    function(x,y) return A_mx[x][y]=1; end,
   			 true);
      gen_graph := rec(group:=group, graph := graph);
   else 
      gen_graph := 0; 
      Display("Input was not a group");
   fi;
	
   return gen_graph;
   
   end
);


