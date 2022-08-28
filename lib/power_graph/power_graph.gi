InstallGlobalFunction(PowerGraph, function(group)
   local graph, power_graph,i,j, e1,e2, A_mx, g_order;

   if IsGroup(group)=true then 
      g_order := Order(group);
      i := 1;
      j := 1;
      # Adjacency Matrix 
      A_mx :=  IdentityMat(g_order);
      for e1 in Elements(group) do
         j:=1;
         for e2 in Elements(group) do
            # Tests POWER graph condition for edge connecting
            if (e1 in Elements(Group(e2))) or
               (e2 in Elements(Group(e1))) then
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
      power_graph := rec(group:=group, graph := graph);
   else 
      power_graph := 0; 
      Error("Input was not a group");
   fi;
	
   return power_graph;
   
   end
);

InstallGlobalFunction(DirectedPowerGraph, function(group)
   local graph, power_graph,i,j, e1,e2, A_mx, g_order;

   if IsGroup(group)=true then 
      g_order := Order(group);
      i := 1;
      j := 1;
      # Adjacency Matrix 
      A_mx :=  IdentityMat(g_order);
      for e1 in Elements(group) do
         j:=1;
         for e2 in Elements(group) do
            # Tests POWER graph condition for edge connecting
            if (e1 in Elements(Group(e2))) then
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
      power_graph := rec(group:=group, graph := graph);
   else 
      power_graph := 0; 
      Error("Input was not a group");
   fi;
	
   return power_graph;
   
   end
);



InstallGlobalFunction(EnhancedPowerGraph, function(group)
   local graph, enh_power_graph,i,j, e1,e2, A_mx, g_order;

   if IsGroup(group)=true then 
      g_order := Order(group);
      i := 1;
      j := 1;
      # Adjacency Matrix 
      A_mx :=  IdentityMat(g_order);
      for e1 in Elements(group) do
         j:=1;
         for e2 in Elements(group) do
            # Tests graph condition for edge connecting
            if (IsCyclic(Group([e1,e2]))) then
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
      enh_power_graph := rec(group:=group, graph := graph);
   else 
      enh_power_graph := 0; 
      Error("Input was not a group");
   fi;
	
   return enh_power_graph;
   
   end
);

InstallGlobalFunction(MaxCyclicSubgroup, function(enh_power_graph)
    local max_clique;
    max_clique := MaximumClique(enh_power_graph.graph);
    return Group(enh_power_graph.graph.names{max_clique});
    end
);
