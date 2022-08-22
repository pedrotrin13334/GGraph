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
