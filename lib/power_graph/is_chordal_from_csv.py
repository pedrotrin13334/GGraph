import pandas as pd
import networkx as nx
import ast 

input_file = "graphs_p_group.csv"
graphs = pd.read_csv(input_file, delimiter=';')
is_chordal = []
filename = 'ischordal_pwg_pgroup.csv' 

for index, row in graphs.iterrows():
    graph = nx.Graph()
    print(row['grp_idx'])
    g_edges = ast.literal_eval(row['power_graph'])
    graph.add_edges_from(g_edges)      
    
    is_chordal.append(nx.is_chordal(graph))

graphs.insert(2, 'is_chordal', is_chordal, True)
graphs.to_csv(filename, sep=';',
              columns=['grp_idx', 'is_chordal'], index=False)
