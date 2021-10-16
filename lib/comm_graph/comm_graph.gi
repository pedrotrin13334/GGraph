
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
            # ignores self loops
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
      comm_graph := rec(group:=group, graph := graph);
   else 
      comm_graph := 0; 
      Display("Input was not a group");
   fi;
	
   return comm_graph;
   
   end
);

InstallGlobalFunction(MaxAbelianSubgroup, function(comm_graph)
    local max_clique;
    max_clique := MaximumClique(comm_graph.graph);
    return Group(comm_graph.graph.names{max_clique});

    end

);

#############################################################################
##
#F  CommDegree( <Group> ) . . . . . . . . . . . . . . . . . . . .  
##  . . . . Finds the commutative Degree of a given group
## 
InstallGlobalFunction(CommDegree, function (group)
    local num_conj_classes;
    num_conj_classes := Size(ConjugacyClasses(group));
    return num_conj_classes/Order(group);
     
    end 
);

#############################################################################
##
#F  CommDegreeGroupFind( <number> ) . . . . . . . . . . . . . . . . 
## . . . . Finds a group with commutative degree EQUAL 1/n
## Using the Castelaz Algorithm	
##
InstallGlobalFunction(CommDegreeGroupFind, function(num)
    local factor_groups_list, primes_list,p, group;
    primes_list := FactorsInt(num);
    factor_groups_list := [];
        for p in primes_list do
            if p = 2 then 
                group := DihedralGroup(6);
            else 
                group := PrimeCommDegreeGroupFind(p);
            fi;
            Append(factor_groups_list, [group]);
        od; 
    return DirectProduct(factor_groups_list);

    end
);

#############################################################################
##
#F  PrimeCommDegreeGroupFind( <prime> ) . . . . . . . . . . . . . . . . 
## . . . . Finds a group with commutative degree EQUAL 1/p
##  Using the Castelaz Algorithm
##
InstallGlobalFunction(PrimeCommDegreeGroupFind, function(prime)
    local numerator, m,p, dihedral_list, prime_list, group;  
    dihedral_list := [];
    m := (prime - RemInt(prime, 4))/4;
    if RemInt(prime,4) = 3 then 
        Append(dihedral_list, [DihedralGroup(2*3*prime)]);
    else  
        Append(dihedral_list, [DihedralGroup(2*prime)]);
    fi; 
    numerator := m+1; 
        while numerator > 1 do
            prime_list := FactorsInt(numerator); 
            numerator := 1 ; 
            for p in prime_list do
                m := (p - RemInt(p,4))/4;
                if m = 0 then 
                   Append(dihedral_list, [DihedralGroup(2*3)]);
                else
                    numerator := numerator*(m+1);
                    if RemInt(p,4) = 3 then 
                        Append(dihedral_list, [DihedralGroup(2*3*p)]); 
                    else 
                        Append(dihedral_list, [DihedralGroup(2*p)]); 
                    fi; 
                fi;
            od; 
        od; 
    return DirectProduct(dihedral_list);

    end
);

#############################################################################
##
#F  NilpotentCommDegreeGroupFind( <number> ) . . . . . . . . . . . . . 
##  . . . . Finds a Nilpotent Group with commutative degree LESS than 1/n
##
InstallGlobalFunction(NilpotentCommDegreeGroupFind, function(num)
    local max_clique;
    #max_clique := MaximumClique(comm_graph.graph);
    #return Group(comm_graph.graph.names{max_clique});
    return 0;

    end
);
