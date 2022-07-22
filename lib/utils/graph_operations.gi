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
    local lex_order, vertex, new_graph;
    if IsGraph(graph) = false then
        return fail;
    elif Girth(graph) = -1 then
        return true;
    else 
        lex_order:= LexBFS(graph);
        Remove(lex_order,1);
        new_graph := graph;
        while Size(lex_order)>2 do
            new_graph := InducedSubgraph(graph, lex_order);
            if IsCompleteGraph(new_graph)=false then
                return false;
            fi;
            Remove(lex_order,1);
        od;
        return true;
    fi;
    end
);
