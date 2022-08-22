#############################################################################
##
#A  graph_tests.tst          GGraph package           Pedro Trindade
##
## This is a test file that validates the main graphs defined on groups 
## implementation.   
## To run a test in this individual file you might read
## the "testall.g" file at the /tst directory. 
##  
gap> START_TEST("first test");

#############################################################################
## Commuting Graph Testing  
#############################################################################
gap> grp := CyclicGroup(9);;
gap> comm_graph := CommGraph(grp);;
gap> IsCompleteGraph(comm_graph.graph);
true

## Testing properties for non-abelian groups
gap> grp := DihedralGroup(12);;
gap> comm_graph := CommGraph(grp);;
gap> IsCompleteGraph(comm_graph.graph);
false

## Tests the comm graph isomorphism of d8 and q8
gap> q8 := QuaternionGroup(8);;
gap> d8 := DihedralGroup(8);;
gap> q8_comm := CommGraph(q8);;
gap> d8_comm := CommGraph(d8);;
gap> IsIsomorphicGraph(d8_comm.graph, q8_comm.graph); 
true

## Tests if the identity is connected with all other elements
gap> grp := QuaternionGroup(8);;
gap> grp_comm := CommGraph(grp);;
gap> VertexDegree(grp_comm.graph, 1) = Order(grp)-1; 
true

## Tests MaxAbelianSubgroup Function
gap> d8 := DihedralGroup(8);;
gap> d8_comm := CommGraph(d8);;
gap> max_abel_sbgrp := MaxAbelianSubgroup(d8_comm);; 
gap> StructureDescription(max_abel_sbgrp);
"C2 x C2"
gap> d14 := DihedralGroup(14);;
gap> d14_comm := CommGraph(d14);;
gap> max_abel_sbgrp := MaxAbelianSubgroup(d14_comm);; 
gap> StructureDescription(max_abel_sbgrp);
"C7"

## Tests the deep commuting graph of V4 (which is a star)
gap> c2 := CyclicGroup(2);; 
gap> v4 := DirectProduct(c2, c2);;
gap> v4_deep := DeepCommGraph(v4);;
gap> v_list := Vertices(v4_deep.graph);;
gap> Remove(v_list, 1);;
gap> no_id_comm := InducedSubgraph(v4_deep.graph, v_list);; 
gap> IsNullGraph(no_id_comm);
true

## In groups with trivial center, the Deep Comm Graph 
## is isomorphic to the Comm Graph
gap> s3 := SymmetricGroup(3);;
gap> s3_comm := CommGraph(s3);;
gap> s3_deep := DeepCommGraph(s3);;
gap> IsIsomorphicGraph(s3_comm.graph, s3_deep.graph); 
true

## This is common functionality testing for all ggraphs
gap> VertexNames(comm_graph.graph);
[ <identity> of ..., f1, f2, f3, f1*f2, f1*f3, f2*f3, 
  f3^2, f1*f2*f3, f1*f3^2, f2*f3^2, f1*f2*f3^2 ]

gap> STOP_TEST("graph_tests.tst",1000);
