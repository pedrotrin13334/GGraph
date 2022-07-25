#############################################################################
##
#F  IntersectGraph( <Group> ) . . . . . . . . . . . . . . . . . .  
##  . . . . Implements the Intersection Graph of a given group
##
##  <#GAPDoc Label="IntersectGraph">
##  <ManSection>
##  <Func Name="CommGraph" Arg="group"/>
##
##  <Description>
##  This function receives a <A>group</A> as an input then utilizes
##  the grape package to implement a graph <Math>(V,E)</Math>
##  applying the following rule:
##  <P/> 
##  The vertices of this graph are the proper non-trivial subgroups
##  of the inputted group <Math>G</Math> 
##  and two vertices <Math> H_1, H_2 </Math<are connected 
##  if <Math>H_1 \cap H_2 \not = \{1\}</Math>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("IntersectGraph");
