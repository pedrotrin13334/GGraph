InstallGlobalFunction(HommGraph, function(group, f_func, h_func)
   local graph, homm_graph,i,j, e1,e2, A_mx, g_order, e1_f, e2_f,
         h1,h2,h3;
   if IsGroup(group)=true then 
      g_order := Order(group);
      i := 1;
      j := 1;
      # Adjacency Matrix 
      A_mx :=  IdentityMat(g_order);
      for e1 in Elements(group) do
         j:=1;
         for e2 in Elements(group) do
            # Tests Homorphism graph condition for edge connecting
            e1_f := f_func(e1);
            e2_f := f_func(e2);

            h1 := h_func(e1_f);
            h2 := h_func(e2_f);
            h3 := h_func(e1_f*e2_f);
            
            if h3 = h1*h2 then
               A_mx[i][j] := 1;
            else 
               A_mx[i][j] := 0;
            fi;

            # This condition guarantees no self loops
            if e1 = e2 then 
                A_mx[i][j] := 0;
            fi;

            j:= j + 1;
         od; 

         i:= i + 1;

      od;   

      graph := Graph(Group(()), [1..g_order], OnPoints, 
                    function(x,y) return A_mx[x][y]=1; end,
   			 true);
      AssignVertexNames(graph, Elements(group));
      homm_graph := rec(group:=group, graph := graph);
   else 
      homm_graph := 0; 
      Display("Input was not a group");
   fi;
	
   return homm_graph;
   
   end
);

