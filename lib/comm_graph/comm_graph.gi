InstallGlobalFunction(HelloWorld1, function()
   Display("Hello World 1");
end);

InstallGlobalFunction(CommGraph, function(group)
   local graph, comm_graph,i,j, e1,e2, A_mx, g_order;

   if IsGroup(group)=true then 
      g_order := Order(group);
      i := 1;
      j := 1;
      # Adjacency Matrix 
      A_mx :=  IdentityMat(g_order);
      for e1 in Elements(group) do
         j:=1;
         for e2 in Elements(group) do
            # Tests Commutative graph condition for edge connecting
            if  e1*e2 = e2*e1 then
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
      comm_graph := rec(group:=group, graph := graph);
   else 
      comm_graph := 0; 
      Display("Input was not a group");
   fi;
	
   return comm_graph;
   
   end
);

