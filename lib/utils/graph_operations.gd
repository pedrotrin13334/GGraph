
#############################################################################
##
#F  GraphFromAdjList( <Adjacency List> ) . . . . . . . . . . . . . . . . . .  
##
##  <#GAPDoc Label="GraphFromAdjList">
##  <ManSection>
##  <Func Name="GraphFromAdjList" Arg="List"/>
##     This Function receives an adjacency list (a list of lists) of vertices 
##     adjacencies. The function then outputs a Grape graph corresponding 
##     to this list. 
##     Optionally it is possible to instead of an adjacency list, input a 
##     record adj_rec encopassing an adj_list in the "adj" name 
##     and a vertex name list with a "vert_name" option".    
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphFromAdjList");

#############################################################################
##
#F  LexBFS( <Graph> ) . . . . . . . . . . . . . . . . . . . .  
##
##  <#GAPDoc Label="LexBFS">
##  <ManSection>
##  <Func Name="LexBFS" Arg="graph"/>
##
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("LexBFS");

#############################################################################
##
#F  IsChordalGraph( <Graph> ) . . . . . . . . . . . . . . . . . . . .  
##
##  <#GAPDoc Label="IsChordalGraph">
##  <ManSection>
##  <Func Name="IsChordalGraph" Arg="graph"/>
##
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("IsChordalGraph");

#############################################################################
##
#F  GraphProductGeneric( <Graph>, <Graph>, <Function> ) . . . . . . . . . . .  
##
##  <#GAPDoc Label="GraphProductGeneric">
##  <ManSection>
##  <Func Name="GraphProductGeneric" Arg=["graph1","graph2", "condition"]/>
##     This is a generic framework function for a graph product, where 
##     it returns a graph where the vertex set is the cartesian product 
##     <Math>G \times H</Math> and the connections follow the condition 
##     defined by the input condition function.  
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphProductGeneric");

#############################################################################
##
#F  GraphCartesianProduct( <Graph> ) . . . . . . . . . . . . . . . . . . . .  
##
##  <#GAPDoc Label="GraphCartesianProduct">
##  <ManSection>
##  <Func Name="GraphCartesian" Arg="graph"/>
##
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphCartesianProduct");

#############################################################################
##
#F  GraphCategoricalProduct( <Graph> ) . . . . . . . . . . . . . . . . . . . .  
##
##  <#GAPDoc Label="GraphCategoricalProduct">
##  <ManSection>
##  <Func Name="GraphCategoricalProduct" Arg="graph"/>
##
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphCategoricalProduct");

#############################################################################
##
#F  GraphLexProduct( <Graph> ) . . . . . . . . . . . . . . . . . . . .  
##
##  <#GAPDoc Label="GraphLexProduct">
##  <ManSection>
##  <Func Name="GraphLexProduct" Arg="graph"/>
##
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphLexProduct");

#############################################################################
##
#F  GraphStrongProduct( <Graph> ) . . . . . . . . . . . . . . . . . . . .  
##
##  <#GAPDoc Label="GraphStrongProduct">
##  <ManSection>
##  <Func Name="GraphStrongProduct" Arg="graph"/>
##
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphStrongProduct");
