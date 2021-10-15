
InstallGlobalFunction(ElemOrders, function(group)
    local order_list, group_order,e1; 
    
    group_order := Order(group);
    order_list := [];

    for e1 in Elements(group) do
        if not(Order(e1) in order_list) then
            Append(order_list, [Order(e1)]);
        fi; 
    od; 
    return order_list;
    end 
);

InstallGlobalFunction(PrimeGraph, function(group)
   local graph, prime_graph,i,j, p1,p2,order_list, A_mx, g_order;

   if IsGroup(group)=true then 
      g_order := Order(group);
      i := 1;
      j := 1;

      # List of elements orders in the group 
      order_list := ElemOrders(group);
      # Adjacency Matrix 
      A_mx :=  IdentityMat(g_order);

      for p1 in PrimeDivisors(g_order) do
         j:=1;
         for p2 in PrimeDivisors(g_order) do
            if (p1*p2 in order_list) then
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
      prime_graph := rec(group:=group, graph := graph);
   else 
      prime_graph := 0; 
      Display("Input was not a group");
   fi;
	
   return prime_graph;
   
   end
);

