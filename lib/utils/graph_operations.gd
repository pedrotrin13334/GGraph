
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
##  <Func Name="GraphProductGeneric" Arg="graph1"/>
##  <Description>
##     This is a generic framework function for a graph product, where 
##     it returns a graph where the vertex set is the cartesian product 
##     <Math>G \times H</Math> and the connections follow the condition 
##     defined by the input condition function.  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##  TODO put this input = ["graph1","graph2", "condition"]
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

##########################################################################
##
## this section of the code make available certain necessary graphs methods
##
## code author: M. Laura da Silva

#############################################################################
##
#F  GraphTwins( <Graph> ) . . . . . . . . . . . . . . . . . . . .  
##
##  <#GAPDoc Label="GraphTwins">
##  <ManSection>
##  <Func Name="GraphTwins" Arg="graph"/>
##
##  <Description> We call two vertices of a graph <Math>\Gamma</Math> 
##  twins if they have the same neighborhood, ignoring themselves. 
##  A neighborhood of a vertice <Math>\v_i</Math> is defined as the set <Math>\N</Math> 
##  of all the vertices <Math>\v_k</Math> that are connected to it.
##  This function returns a list of lists containing a particion of the input 
##  graph represented by the equivalence classes of twin vertices.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphTwins"); 

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
DeclareGlobalFunction("IsTwinFree"); 

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
DeclareGlobalFunction("TwinReduction"); 

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
DeclareGlobalFunction("CokernelGraph"); 
