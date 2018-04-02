
##################################################################
# Importazione file in R e visualizzazioni
##################################################################

my.data <- read.csv("vanAllC.csv", sep=",") # questo file csv necessita del separatore "," 
cat("quantità di osservazioni per fornitore: ", paste(unique(my.data$vendor),(summary(my.data$vendor))))
my.data[15:20,]; tail(my.data)
datarws <- nrow(my.data) # aggiungo il totale numero di osservazioni a datarws per utilizzarlo anche in seguito
cat("numero totale di osservazioni: ", datarws)

# creiamo un data frame con i prezzi per ogni fornitore
data1 <- my.data$price.mo[my.data$vendor==unique(my.data$vendor)[1]] 
data2 <- my.data$price.mo[my.data$vendor==unique(my.data$vendor)[2]]

# conservo in n1 e n2 il numero di osservazioni per fornitore
n1 = length(data1); n2 = length(data2)

# inserisco in v1 e v2 il nome del fornitore e calcolo in md1 e md2 la media delle osservazioni
v1 = unique(my.data$vendor)[1]; v2 = unique(my.data$vendor)[2]
md1 = mean(data1); md2 = mean(data2) 

# per mostrare la media per avere un idea della differenza.
cat("media prezzi per fornitore: \n", 
    paste(v1,"\n","€",round(md1,2),"\n", v2,"\n","€",round(md2,2))
   )

# Visualizziamo ora con dei grafici l'andamento dei prezzi per i due fornitori
par(mfrow=c(2,3)) 
opts <- c("l","s","h") # visualizziamo grafici del tipo lines, stair steps e vertical lines histogram
for(i in 1:length(opts)){
  heading = paste("fornitore ",v1," type=",opts[i])
  plot(data1, ylab="prezzo", type="n", main=heading)
  lines(data1, type=opts[i])
    # regressione lineare tra i valori e il n° delle osservazioni per traciare linee di tendenza
    abline(lm(data1~c(1:n1)), lty=2) 
    abline(lm(data2~c(1:n2+(n1-n2))), col="red", lty=2) # inserisco linea di tendenza del secondo fornitore
    legend("topleft", c(paste("tendenza",v1),paste("tendenza",v2)), cex = 1, y.intersp=2,
        col=c("black","red"), lty=2:2, bty="n")
}
for(i in 1:length(opts)){
  heading = paste("fornitore ",v2," type=",opts[i])
  plot(data2, ylab="prezzo", type="n", main=heading)
  lines(data2, type=opts[i])
    # regressione lineare tra i valori e il n° delle osservazioni per traciare linee di tendenza
    abline(lm(data2~c(1:n2)), lty=2)
    abline(lm(data1~c(1:n1-(n1-n2))), col="red", lty=2) # inserisco linea di tendenza del secondo fornitore
    legend("topleft", c(paste("tendenza",v2),paste("tendenza",v1)), cex = 1, y.intersp=2,
        col=c("black","red"), lty=2:2, bty="n")
}
