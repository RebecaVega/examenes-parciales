### REBECA VEGA ESCAMILLA ###

library(igraphdata)# es la que tiene los datos

data("karate")
plot(karate)# lo grafico pa ver si sale

# 1.Encuentre las tres personas más conectadas.

mas<-degree(karate,mode = "in")
mas
sort(mas,decreasing = TRUE)

#2. La gráfica de la distribución de conectividades.

dc<-degree.distribution(karate)
plot(dc)

#3. El diámetro de la red.

diameter(karate)

#4. El coeficiente de clusterización cada una de las 3 personas más conectadas

transitivity(karate)

#5. Encuentre si los hay, a los nodos con coeficiente de clusterización de 1.
# Discute su significado.

transitivity(karate, type="local") #Al parecer si los hay y son varios así que
# quiere decir que están muy conectados

#6. El porcentaje de conexiones respecto al total.

#7. El promedio de conectividades.

prom<-degree(karate)
prom
mean(prom)

mean_distance(karate) # creo que este es el bueno
 
#8. Encuentre QUIÉNES son las 3 personas más importantes con al menos 3 distintos métodos
  
shortest.paths(karate)
all_shortest_paths(karate, 3)

#9.Encuentre la trayectoria entre las personas más alejadas. 

farthest.nodes(karate) # lo hago con esta función que es para eso, literal busca 
#los nodos más alejados

#10. Clusteriza la red con al menos 4 métodos distintos y discute tu resultado sabiendo
#que ese grupo de personas se separo en dos clubes distintos con el tiempo.

cluster.distribution(karate)
cluster_fluid_communities(karate, no.of.communities = 5)
cluster_infomap(karate) # me arrojó tres grupos 
cluster_label_prop(karate) # me arrojó cuatro grupos

