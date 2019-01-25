install.packages("igraph")
library("igraph")

g=graph(c(1,2, 1,3, 2,3, 3,5), n=5)

plot(g)

#vertex sequence:
V(g)

#edge sequence
E(g)

#Adding Nodes and Edges
g=graph.empty()+vertices(letters[1:10],
                         color="red")
plot(g)
#More Additions
g=g+vertices(letters[11:20],
             color="yellow")
plot(g)
#We add edges sampling from the existing
#edges in g:
g=g+edges(sample(V(g),30,replace=TRUE),
          color="green")
#take a look:
plot(g)

#resulting Vertex sequence:
V(g)

#resulting Edge sequence
E(g)

#loading data
karate=read.graph("http://cneurocvs.rmki.kfki.hu/igraph/karate.net",format="pajek")

plot(karate)

help(igraph.plotting)

?transitivity
transitivity(karate, type = c("undirected"))

?degree
degree(karate, v = V(karate), mode = c("all", "out", "in", "total"),
       loops = TRUE, normalized = FALSE)

?degree.distribution
degree_distribution(karate, cumulative = FALSE)

#diameter() and average.path.length():
g=graph.lattice(length=100,dim=1, nei=4)
plot(g)
