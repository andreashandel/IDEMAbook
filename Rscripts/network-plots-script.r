############################################################
##a script to make and plot some 
##written by Andreas Handel (ahandel@uga.edu), last change 10/25/16
############################################################
rm(list=ls()) #this clears the workspace to make sure no leftover variables are floating around. Not strictly needed
graphics.off(); #close all graphics windows
library(igraph)  #package that provides most of the graph/network functionality used here


#do a 4-panel plot
par(mfrow=c(2,2))

###################################################################
#random/Erdos-Renyi network
###################################################################
ER1 = erdos.renyi.game(200,0.05,type="gnp") #a random network with 100 nodes, 500 edges 
plot(ER1, vertex.label = NA, vertex.size = 5, edge.width=1, edge.color='black', vertex.color='lightblue',main='Random network with N=200, p=0.05') #plot network/graph

ER2 = erdos.renyi.game(1000,0.01,type="gnp") #a random network with 1000 nodes, 5000 edges - too big to plot, but decent size for calculating various metrics
ddrg=degree(ER2) #distribution of edges/connections/contacts for each vertex/node/person 
hist(ddrg,xlab='Connections/Degree',ylab='Frequency', freq = TRUE, main='Degree distribution of a random network with N=1000, p=0.01', col = 'lightblue')
cat("plot of degree distribution for a 1000 node random network \n")
cat("press `c' to continue \n")
#browser()

r1=graph.density(ER2) #The density of a graph is the ratio of the number of edges and the number of possible edges
r2=diameter(ER2) #The diameter of a graph is the length of the longest geodesic 
r3=radius(ER2) #The smallest eccentricity in a graph is called its radius 
r4=average.path.length(ER2) #average path length between nodes
r5=assortativity.degree(ER2,directed=FALSE) #The assortativity coeffcient is positive if similar vertices (based on some external property) tend to connect to each, and negative otherwise
r6=clique.number(ER2) #calculates the size of the largest clique(s)
#print(sprintf('Density: %f, Diameter: %f, Radius: %f, Average Path Length %f, Assortativity: %f, Size of larges clique: %f',r1,r2,r3,r4,r5,r6))
#cat("press `c' to continue \n")
#browser()

#--> Based on the specifications given when the network is created (the erdos.reny.game command), 
#--> compute the theoretically expected average number of links (see notes) and compare it with the actual number for a few networks
#theory.av=(1000-1)*0.01; real.av=mean(dd);

###################################################################
#create a scale-free network
###################################################################
SF1 <- barabasi.game(200,directed=FALSE) #a scale-free graph with 100 nodes
plot(SF1, vertex.label = NA, vertex.size = 5, edge.width=1, edge.color='black',main='Scale-free network with N=200') #plot network/graph)

SF2 <- barabasi.game(1000,directed=FALSE) #a scale-free graph with 1000 nodes - too big to plot, but decent size for calculating various metrics
ddsd=degree(SF2) #distribution of edges/connections/contacts for each vertex/node/person 
mydata_hist <- hist(ddsd, plot=FALSE)
plot(mydata_hist$counts,xlab='Connections/Degree',ylab='Frequency',  main='Degree distribution of a scale-free network with N=1000', col = 'orange', log ='xy',type='h', lwd=10, lend=1)
cat("plot of degree distribution for a 1000 node scale-free network \n")
cat("press `c' to continue \n")



browser()

r1=graph.density(SF2) #The density of a graph is the ratio of the number of edges and the number of possible edges
r2=diameter(SF2) #The diameter of a graph is the length of the longest geodesic 
r3=radius(SF2) #The smallest eccentricity in a graph is called its radius 
r4=average.path.length(SF2) #average path length between nodes
r5=assortativity.degree(SF2,directed=FALSE) #The assortativity coeffcient is positive if similar vertices (based on some external property) tend to connect to each, and negative otherwise
r6=clique.number(SF2) #calculates the size of the largest clique(s)
print(sprintf('Density: %f, Diameter: %f, Radius: %f, Average Path Length %f, Assortativity: %f, Size of larges clique: %f',r1,r2,r3,r4,r5,r6))
cat("press `c' to continue \n")
browser()

#--> try to adjust the size of the network and the way you plot the degree distribution such that you can clearly see the power-law dependency
#--> that's not completely straightforward since you need to figure out how to get something like a histogram with x and y axes on a log scale. 
#--> try to google it and figure it out
dd.hist=hist(dd); plot(dd.hist$mids,dd.hist$counts,log="xy")

###################################################################
#small-world network
###################################################################
WS1 <- watts.strogatz.game(1, 100, 2, 0.01) #a small-world network of size 100 
plot(WS1)
cat("plot of a 100 node Small-world-free network \n")
cat("press `c' to continue \n")
browser()


WS2 <- watts.strogatz.game(1, 1000, 2, 0.01) #a small-world network 
dd=degree(WS2) #distribution of edges/connections/contacts for each vertex/node/person 
hist(dd,xlab='connections',ylab='frequency')
cat("plot of degree distribution for a 1000 node small-world network \n")
cat("press `c' to continue \n")
browser()

r1=graph.density(WS2) #The density of a graph is the ratio of the number of edges and the number of possible edges
r2=diameter(WS2) #The diameter of a graph is the length of the longest geodesic 
r3=radius(WS2) #The smallest eccentricity in a graph is called its radius 
r4=average.path.length(WS2) #average path length between nodes
r5=assortativity.degree(WS2,directed=FALSE) #The assortativity coeffcient is positive if similar vertices (based on some external property) tend to connect to each, and negative otherwise
r6=clique.number(SF2) #calculates the size of the largest clique(s)
print(sprintf('Density: %f, Diameter: %f, Radius: %f, Average Path Length %f, Assortativity: %f, Size of larges clique: %f',r1,r2,r3,r4,r5,r6))
cat("press `c' to continue \n")
browser()

#--> try to compute the transitivity for this network (see slides for definition). See how it changes as you change the rewiring probability of the Watts-Strogatz network
transitivity(WS2)


###################################################################
#real data network
#you need to be online to get the data
###################################################################
RN=nexus.get(2) #download a Social network among faculty members at a UK university from http://nexus.igraph.org/
summary(RN)
plot(RN) 

#--> play around with this real network
#--> apply whatever you can think of from the functions above, others in igraph, or some of your own to this real network


