###############################################################
## This code tests the util functions for graphs defined on 
## groups.
## You must run it with Read("testall.g") 
##

## First with the chordality tests
## Every p-group is chordal
gap> grp := OneSmallGroup(32, x-> not IsAbelian(x));;
gap> grp_pg := PowerGraph(grp);;   
gap> IsChordalGraph(grp_pg.graph);
true

## This group is the first non-nilpotent 
## Non Chordal Group
gap> grp:= SmallGroup([36,6]);; 
gap> StructureDescription(grp);
"C3 x (C3 : C4)"
gap> grp_pg := PowerGraph(grp);;
gap> IsChordalGraph(grp_pg.graph);
false

## The first non-chordal dihedral group 
## is D60
gap> grp := DihedralGroup(60);;
gap> grp_pg := PowerGraph(grp);;
gap> IsChordalGraph(grp_pg.graph);
false

###############################################################
## This code tests the Twin Reduction/Cokernel functionality 
## 

## All Null and complete graphs have trivial cokernel
gap> cmp_graph := CompleteGraph(Group(()), 5);;
gap> coker := CokernelGraph(cmp_graph);;
gap> OrderGraph(coker);
1

gap> null_graph := NullGraph(Group(()),5);;
gap> coker := CokernelGraph(null_graph);;
gap> OrderGraph(coker);
1

## The D8 group has a cograph NonGenGraph
gap> dih_grp := DihedralGroup(8);;
gap> nong_ggraph := NonGenGraph(dih_grp);;
gap> coker := CokernelGraph(nong_ggraph.graph);;
gap> OrderGraph(coker);
1

## The NonGenGraph of a finite non abelians
## simple group is not a cokernel
gap> alt_grp := AlternatingGroup(5);;
gap> nong_ggraph := NonGenGraph(alt_grp);;
gap> coker := CokernelGraph(nong_ggraph.graph);;
gap> OrderGraph(coker);
32
