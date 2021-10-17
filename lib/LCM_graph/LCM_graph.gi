InstallGlobalFunction(LCMGraph, function(group)
   local graph, lcm_graph,i,j, e1,e2, A_mx, g_order, lc_gen, elm_sum, lc_group;
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
            if e1 = e2 then 
               A_mx[i][j] := 0;  # Make graph simple
               elm_sum := elm_sum + 1;
            elif Order(e1) <> Exponent(group) and 
            RemInt(LcmInt(Order(e1),Order(e2)), Order(e1*e2)) = 0
            then
	       elm_sum := elm_sum +1;
               A_mx[i][j] := 1;

            else
               A_mx[i][j] := 0;
            fi; 
            j:= j + 1;
         od; 

	if elm_sum = g_order then
	   Append(lc_gen, [e1]); 
        fi;

         i:= i + 1;
      od;   
      lc_group := Group(lc_gen);
      graph := Graph(Group(()), [1..g_order], OnPoints, 
                    function(x,y) return A_mx[x][y]=1; end,
   			 true);
      lcm_graph := rec(group:=group, graph := graph, lcGroup := lc_group);
   else 
      lcm_graph := 0; 
      Display("Input was not a group");
   fi;
	
   return lcm_graph;
   
   end
);


InstallGlobalFunction(LC, function(group)
    local lc_group, i, j, e; 
    lc_group :=[];;
    e:=Elements(group);;
    for i in e do
        if Order(i) <> Exponent(group) and 
        ForAll(e, j-> IsInt(Lcm(Order(i),Order(j))/(Order(i*j))))=true
        then
            Add(lc_group, i);
        fi;
    od;
    return Group(lc_group);
    end
);

InstallGlobalFunction(LCMSet, function(group)
    local lcm_set, i, j, e; 
    lcm_set :=[];;
    e:=Elements(group);;
    for i in e do
        if Order(i) <> Exponent(group) and 
        ForAll(e, j-> IsInt(Lcm(Order(i),Order(j))/(Order(i*j))))=true
        then
            Add(lcm_set, i);
        fi;
    od;
    return lcm_set;
    end
);


InstallGlobalFunction(IsLCGroup, function(group, lc_group)
    local e;
    e := Elements(group);
    return Union(lc_group, Filtered(e, x->Order(x)=Exponent(group))) = group;

    end
);
