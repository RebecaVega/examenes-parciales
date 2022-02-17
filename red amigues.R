### REBECA VEGA ESCAMILLA ###

# priemro voy a leer mi  archivo
matriz<- read.csv("C:/Users/perse/OneDrive/Escritorio/practicas genom/Red de amigues.csv")
matriz 
row.names(matriz)<-matriz[,1] # ponemos nombres a los renglones
matriz<-matriz[,-1]
# Quitamos los datos con NA
matriz<-matriz[-2,]
matriz<-matriz[,-2]
matriz<-as.matrix(matriz)
matriz
library(igraph)

plot(matriz)# grafico la red usando plot 
hist(matriz) # creo que también así queda bien

#Cargo  la matiz de adyacencia para poder hacer lo demás
red_gf<-graph_from_adjacency_matrix(matriz,mode = "directed")
#2. Determine a las tres personas con más amigues

elegido<-degree(red_gf,mode = "in") # saco el degreepara que calcule el numero de 
# conexiones que tiene un nodo 
sort(elegido,decreasing = TRUE)
# los acomodo de mayor a menor y ahí me va a salir a que personas le pusieron que
# son amigxs y ahí dice que es carolina, mayela y mafer

# 3. Determine a las tres personas que consideran que tiene más amigues
 
elige<-degree(red_gf,mode = "out") # Ahora hago lo mismo pero usando out 
# para saber a cuantos eligieron
sort(elige, decreasing = TRUE)# lo acomodo de mayor a menor para que salgan los 3
# y salen enrique, julian y mafer

# 4. Las tres personas más importantes por tres medidas de centralidad

uno<-centralization.evcent.tmax(graph= red_gf)
uno
dos<-centralization.betweenness(red_gf)
dos
tres<-centralization.closeness(red_gf)
tres


# 5. Clusteriza la red con al menos dos métodos y determine cuáles son los clústers.

clstr1<-cluster.distribution(red_gf)
clstr1
plot(clstr1) # nada más lo grafiqué para ver como se ve

clstrdos <- cluster_walktrap(red_gf)
clstrdos # me arrojó tres grupos
members <- membership(clstrdos)
members

#6. Calcule el diámetro

diamix<-diameter(red_gf) # Calculo neldiametro con diameter, pongo el nombre de
# mi red y me sale que el diametro es 3
diamix

# 7. La matriz de distancias y dibuje un heatmap
matd<- as.matrix(get.adjacency(red_gf))
matd

heatmap(matd, Rowv = NA, Colv = "Rowv", ) # es para hacer el mapa de calor 
