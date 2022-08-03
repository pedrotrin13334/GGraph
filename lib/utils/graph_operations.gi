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

