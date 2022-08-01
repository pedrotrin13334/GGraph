#############################################################################
##
#F  GenGraph( <Group> ) . . . . . . . . . . . . . . . . . . . .  
##  . . . . Implements the Generating Graph of a given group
##
##  <#GAPDoc Label="GenGraph">
##  <ManSection>
##  <Func Name="GenGraph" Arg="group"/>
##
##  <Description>
##  This function receives a <A>group</A> as an input then utilizes
##  the <Package>Grape</Package> package to implement a
## graph <Math>(V,E)</Math> applying the following rule:
##  <P/> 
##  The vertices of this graph are the elements of the inputted group
##  <Math>G</Math> and two vertices <Math>x,y \in G</Math> are connected
##  if <Math>x,y</Math> generates <Math> G</Math>. 
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GenGraph");

#############################################################################
##
#F  NonGenGraph( <Group> ) . . . . . . . . . . . . . . . . . . . .  
##  . . . . Implements the Non Generating Graph of a given group
##
##  <#GAPDoc Label="NonGenGraph">
##  <ManSection>
##  <Func Name="NonGenGraph" Arg="group"/>
##
##  <Description>
##  This function returns a group graph that is the graph complement 
##  of the Generating Graph of the input group.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("NonGenGraph");
