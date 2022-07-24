#############################################################################
##
#F  CommGraph( <Group> ) . . . . . . . . . . . . . . . . . . . .  
##  . . . . Implements the Commutative Graph of a given group
##
##  <#GAPDoc Label="CommGraph">
##  <ManSection>
##  <Func Name="CommGraph" Arg="group"/>
##
##  <Description>
##  This function receives a <A>group</A> as an input then utilizes
##  the grape package to implement a graph <M>(V,E)</M> applying the following rule:
##  <P/> 
##  The vertices of this graph are the elements of the inputted group
##  <M>G</M> and two vertices are connected if the elements commute
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("CommGraph");

#############################################################################
##
#F  CommDegree( <Group> ) . . . . . . . . . . . . . . . . . . . .  
##  . . . . Finds the commutative Degree of a given group
##
##  <#GAPDoc Label="CommDegree">
##  <ManSection>
##  <Func Name="CommDegree" Arg="group"/>
##
##  <Description>
##  The commutativity degree of a group is defined as the probability
##  that two elements of the group commutes. 
##  <P/>
##  The CommDegree function receives a <A>group</A> as an input then
##  outputs a number <M>\text{CommDegree}(G) \in (\frac{5}{8}, 1)</M>
##  that represents this probability. If the group is abelian, then
##  the commutative degree is 1. Otherwise it is always less than 
##  <M>\frac{5}{8}</M> as consequence of the <M>\frac{5}{8}</M>
##  lower bound theorem.  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("CommDegree");

#############################################################################
##
#F  MaxAbelianSubgroup( <Group> ) . . . . . . . . . . . . . . . . . .  
##  . . . .  Finds a maximum abelian subgroup of a group G
##
##  <#GAPDoc Label="MaxAbelianSubgroup">
##  <ManSection>
##  <Func Name="MaxAbelianSubgroup" Arg="group"/>
##
##  <Description>
##  This function receives a <A>group</A> as an input then utilizes
##  grape function MaximumClique(<A>graph</A>) and then return the
##  maximum clique elements.   
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("MaxAbelianSubgroup");

#############################################################################
##
#F  CommDegreeGroupFind( <number> ) . . . . . . . . . . . . . . . . 
## . . . . Finds a group with commutative degree EQUAL 1/n
## using the Castelaz Algorithm	
##
##  <#GAPDoc Label="CommDegreeGroupFind">
##  <ManSection>
##  <Func Name="CommDegreeGroupFind" Arg="group"/>
##
##  <Description>
##  This function receives an integer number <M>n</M> and then outputs
##  a group <M>G</M> with commutativity degree <M>\frac{1}{n}</M>. 
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("CommDegreeGroupFind");

#############################################################################
##
#F  PrimeCommDegreeGroupFind( <prime> ) . . . . . . . . . . . . . . . . 
## . . . . Finds a group with commutative degree EQUAL 1/p
##  Using the Castelaz Algorithm
##
##  <#GAPDoc Label="PrimeCommDegreeGroupFind">
##  <ManSection>
##  <Func Name="PrimeCommDegreeGroupFind" Arg="prime"/>
##
##  <Description>
##  The PrimeCommDegreeGroupFind function receives a prime number 
##  <M>p</M> and returns a group <M>G</M> with commutativity degree
##  <M>\frac{1}{p}</M>, the CommDegreeGroupFind function uses this function  
##  taking the prime factorization of the number <M>n</M> and taking
##  the direct product of the groups with commmutativity degree equal  to <M>\frac{1}{p_i}</M>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("PrimeCommDegreeGroupFind");

#############################################################################
##
#F  NilpotentPrimeCommDegreeGroupFind( <prime> ) . . . . . . . . . . . . . 
##  . . . . Finds a Nilpotent Group with commutative degree LESS than 1/n
##
##  <#GAPDoc Label="NilpotentPrimeCommDegreeGroupFind">
##  <ManSection>
##  <Func Name="NilpotentPrimeCommDegreeGroupFind" Arg="prime"/>
##
##  <Description>
##  Similar to the PrimeCommDegreeGroupFind, but returning a nilpotent 
##  group with commutativity degree less than <M>\frac{1}{p}</M> given a prime
##  number <M>p</M>.  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("NilpotentPrimeCommDegreeGroupFind");

#############################################################################
##
#F  NilpotentCommDegreeGroupFind( <number> ) . . . . . . . . . . . . . 
##  . . . . Finds a Nilpotent Group with commutative degree LESS than 1/n
##
##  <#GAPDoc Label="NilpotentCommDegreeGroupFind">
##  <ManSection>
##  <Func Name="NilpotentCommDegreeGroupFind" Arg="number"/>
##
##  <Description>
##  Similar to the PrimeCommDegreeGroupFind, but returning a nilpotent 
##  group with commutativity degree less than <M>\frac{1}{n}</M> given an integer
##  number <M>n</M>.  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("NilpotentCommDegreeGroupFind");
