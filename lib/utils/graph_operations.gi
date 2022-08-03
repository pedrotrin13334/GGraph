####################################################
##   This function receives a connected graph and an 
## initial point then output the LexBFS ordering
## for this graph. 
##
InstallGlobalFunction(LexBFS, function(graph)
    local v_num, vert_labels, n, i, idx, not_in_queue, set1, set2,
    queue, adj_list, vert, next_vert, max_label;
    
    v_num := OrderGraph(graph);
    vert_labels := [];;
    
    # Initialize and empty labels list
    for idx in [1..v_num] do
        Add(vert_labels,[0]);
    od;
    
    n := v_num;
    
    # first iteration
    queue := [1];
    adj_list := Adjacency(graph,1);
    for vert in adj_list do
        Add(vert_labels[vert], n);
    od;
    
    n := n-1;
    # for the other iterations
    while n > 0 do
        # take the vertex with max lex order
        max_label := ShallowCopy(vert_labels);

        # We'll make the set of all elm not in queue
        not_in_queue := [1..v_num];
        SubtractSet(not_in_queue, queue); 
        max_label := max_label{not_in_queue};

        Sort(max_label);
        max_label := Reversed(max_label)[1];
        
        i := 1;
        
        # Finds the position of max_label ocurrencies
        next_vert := Positions(vert_labels, max_label);
        
         # Not use any element in the queue for next vertex
        next_vert := next_vert[1]; 
        while IsSubset(queue,[next_vert])=true do
            i := i+1;
            next_vert := Positions(vert_labels, max_label)[i];
        od;
        
        Add(queue, next_vert);; 
        adj_list := Adjacency(graph, next_vert);;
        
        for vert in adj_list do
            if ( IsSubset(queue, [vert])= false) then
                Add(vert_labels[vert], n);;
            fi;
        od;
        n := n-1;
    od;

    return queue; 
    end
);

InstallGlobalFunction(IsChordalGraph, function(graph)
    local lex_order,new_graph, adj_v, test_graph, idx, removed_verts;
    
    if IsGraph(graph) = false then
        return fail;
    elif Girth(graph) = -1 then
        return true;
    else 
        lex_order:= LexBFS(graph);

        # Takes the LexBFS order in reverse 
        # remove one vertex at a time in order
        # then tests if neighborhood induces a clique
        lex_order := Reversed(lex_order);
        removed_verts := [];
        
        for idx in [1..OrderGraph(graph)-1] do
            
            adj_v := Adjacency(graph, lex_order[idx]);
            SubtractSet(adj_v, removed_verts);
            Add(removed_verts, lex_order[idx]);
            
            test_graph := InducedSubgraph(graph, adj_v);;

            if IsCompleteGraph(test_graph)=false then
                return false;
            fi;

        od;
        return true;
    fi;
end 
);

InstallGlobalFunction(GraphFromAdjList, function(adj_list)
    local graph;
    
    if IsRecord(adj_list) then
        if IsBound(adj_list.vert_set) then
            
            graph := Graph(Group(()), [1..Size(adj_list.adj)], OnPoints,
                       function(x,y) 
                           return (adj_list.vert_set[y] in adj_list.adj[x]); 
                       end, true);
            return graph;
        fi;
        
    elif IsList(adj_list)=true then
        
        graph := Graph(Group(()), [1..Size(adj_list)], OnPoints,
                       function(x,y)       
                           return (y in adj_list[x]);
                       end, true);
        return graph;
    else 
        Error("Input was not an adjacency list");
        return fail;
    fi;
    end
);

InstallGlobalFunction(GraphProductGeneric, function(graph1, graph2, condition)
    
    local vert_g1, vert_g2, names_g1, names_g2, new_vertex_set,
    new_vertex_names, adj_list, i, new_graph, vert1,vert2;
    
    if (IsGraph(graph1) and IsGraph(graph2)) then
        
        vert_g1 := Vertices(graph1);
        vert_g2 := Vertices(graph2);
        
        names_g1 := VertexNames(graph1);
        names_g2 := VertexNames(graph2);
        
        new_vertex_set := Cartesian(vert_g1, vert_g2);
        new_vertex_names := Cartesian(names_g1, names_g2);
        
        adj_list := [];
        i := 0; 
        for vert1 in new_vertex_set do
            i := i + 1;
            Add(adj_list,[]);
            for vert2 in new_vertex_set do
                if (condition(vert1 , vert2, graph1, graph2) = true) then
                    Add(adj_list[i], vert2);
                fi;
            od;
        od;
        
        adj_list := rec(adj:= adj_list, vert_set := new_vertex_set);
    
        new_graph := GraphFromAdjList(adj_list);
        AssignVertexNames(new_graph, new_vertex_names);
        
        return new_graph;
    else
        Error("Input was not two graphs");
        return fail;
    fi;
    
    end
);

InstallGlobalFunction(GraphCartesianProduct, function(graph1, graph2)
    local condition, new_graph; 
    # The condition for cartesian product adjacency
    condition := function(vert1, vert2, graph1, graph2)
        local cond_value;
        cond_value := ((vert1[1] = vert2[1]) and
                        (vert1[2] in Adjacency(graph2, vert2[2]))) or
                        ((vert1[1] in Adjacency(graph1, vert2[1])) and
                        vert1[2] = vert2[2]);
        return cond_value;
    end;

    new_graph := GraphProductGeneric(graph1, graph2, condition);;
    return new_graph;
end
);

InstallGlobalFunction(GraphCategoricalProduct, function(graph1, graph2)
    local condition, new_graph; 
    # The condition for categorical product adjacency
    condition := function(vert1, vert2, graph1, graph2)
        local cond_value;
        cond_value := ((vert1[1] in Adjacency(graph1, vert2[1]) and
                        (vert1[2] in Adjacency(graph2, vert2[2])))); 
        
        return cond_value;
    end;

    new_graph := GraphProductGeneric(graph1, graph2, condition);;
    return new_graph;
end
);

InstallGlobalFunction(GraphLexProduct, function(graph1, graph2)
    local condition, new_graph; 
    # The condition for Lexical product adjacency
    condition := function(vert1, vert2, graph1, graph2)
        local cond_value;
        cond_value :=   (vert1[1] in Adjacency(graph1, vert2[1]))  or
                        ((vert1[2] = vert2[2]) and
                        (vert1[2] in Adjacency(graph2, vert2[2])));
        
        return cond_value;
    end;

    new_graph := GraphProductGeneric(graph1, graph2, condition);;
    return new_graph;
end
);

InstallGlobalFunction(GraphStrongProduct, function(graph1, graph2)
    local condition, new_graph; 
    # The condition for strong product adjacency
    condition := function(vert1, vert2, graph1, graph2)
        local cond_value;
        cond_value := ((vert1[1] = vert2[1]) and
                        (vert1[2] in Adjacency(graph2, vert2[2]))) or
                        ((vert1[1] in Adjacency(graph1, vert2[1])) and
                        vert1[2] = vert2[2]) or
                        ((vert1[1] in Adjacency(graph1, vert2[1])) and
                        (vert1[2] in Adjacency(graph2, vert2[2])));
        return cond_value;
    end;

    new_graph := GraphProductGeneric(graph1, graph2, condition);;
    return new_graph;
end
);

InstallGlobalFunction(TwinReduction, function(graph, twin_list)
    local vertices, idx, new_graph;
    vertices := Vertices(graph);
    for idx in [1..Size(twin_list)] do
        if idx>1 then
            RemoveSet(vertices, twin_list[idx]);;
        fi;
    od;
    new_graph := InducedSubgraph(graph, vertices);;
    return new_graph;
end);

InstallGlobalFunction(GraphTwins, function(graph)
    local twins, v, x, adjx, adjv, new_twin;
    twins := [];;
    for v in Vertices(graph) do
        if Size(twins) = 0 then
            Add(twins,[v]);
        else
            new_twin := true;
            for x in twins do
                adjx := Adjacency(graph,x[1]);;
                adjv := Adjacency(graph,v);;
                if IsInt(Position(adjx, v)) = true then
                    Remove(adjx,Position(adjx, v));;
                    Remove(adjv,Position(adjv, x[1]));;
                fi;
                if IsEqualSet(adjx,adjv)=true then
                    Add(x,v); 
                    new_twin:= false;
                fi;
            od;
            if (new_twin = true) then
                Add(twins,[v]);
            fi;
        fi;
    od;
    return twins;
end);


InstallGlobalFunction(IsTwinFree, function(graph)
    local twins;
    twins := GraphTwins(graph);
    if Size(twins)=OrderGraph(graph) then
        return true;
    else
        return false;
    fi;
end);

InstallGlobalFunction(CokernelGraph, function(graph)
    local new_graph, twin_list, twin_num, idx;
    new_graph := graph;
    while IsTwinFree(new_graph) <> true do
        twin_list := GraphTwins(new_graph);
        twin_num := List(twin_list, x -> Size(x));
        # The Cokernel method starts the reductions 
        # from the largest class of twins
        idx := Position(twin_num, Maximum(twin_num));
        new_graph := TwinReduction(new_graph,twin_list[idx]);
    od;
    return new_graph;
end);

